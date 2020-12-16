JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
TOBSYAML=$(echo ${JSON_TASK_PARAMS} | jq '.tobs_yaml')

echo "JSON_TASK_PARAMS=${JSON_TASK_PARAMS}\n" > /tmp/klevr_debug
echo "PROVNS=${PROVNS}\n" >> /tmp/klevr_debug
echo "TOBSYAML=${TOBSYAML}\n" >> /tmp/klevr_debug

#helm test
provbeetmp="NexClipper.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
echo "provbeetmp=${provbeetmp}\n\n" >> /tmp/klevr_debug

ssh provbee-service "echo $TOBSYAML > /tmp/$provbeetmp.base64"
cat /tmp/$provbeetmp.base64 >> /tmp/klevr_debug
echo "\n\n" >> /tmp/klevr_debug

ssh provbee-service busybee tobs install $PROVNS $provbeetmp
##########IN
#p8sinstchk=`ssh provbee-service busybee tobs install_chk`
#TASK_RESULT=$(echo "{}" | jq '. += {"P8S_INSTALL": "'"$p8sinstchk"'"}')
##########IN

############DELLLLLLLLLLLLLL
######TEST INFO
############DELLLLLLLLLLLLLL 
GRAFANA_PW=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_credential')
echo "GRAFANA_PW=${GRAFANA_PW}\n\n\n" >> /tmp/klevr_debug
grafanapw=`ssh provbee-service busybee tobs passwd $PROVNS $GRAFANA_PW`
grafanainfo=`ssh provbee-service busybee nodesearch nc-grafana`
TASK_RESULT=$(echo "{}" | jq '. += {"GRAFANA_URL": "'"$grafanainfo"'", "GRAFANA_PW_CHANGE": "'"$grafanapw"'"}')
############DELLLLLLLLLLLLLL

echo TASK_RESULT=${TASK_RESULT} >> /tmp/klevr_debug
