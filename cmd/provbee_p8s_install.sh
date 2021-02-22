JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
TOBSYAML=$(echo ${JSON_TASK_PARAMS} | jq '.tobs_yaml')
GRAFANA_PW=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_credential')

echo "JSON_TASK_PARAMS=${JSON_TASK_PARAMS}\n" > /tmp/klevr_debug
echo "PROVNS=${PROVNS}\n" >> /tmp/klevr_debug
echo "TOBSYAML=${TOBSYAML}\n" >> /tmp/klevr_debug
echo "GRAFANA_PW=${GRAFANA_PW}\n\n\n" >> /tmp/klevr_debug

#helm test
##### RUN
provbeetmp="NexClipper.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
echo "provbeetmp=${provbeetmp}\n\n" >> /tmp/klevr_debug


################### OLD
ssh provbee-service "echo $TOBSYAML > /tmp/$provbeetmp.base64"
ssh provbee-service busybee tobs install $PROVNS $provbeetmp
ssh provbee-service busybee tobs instpw $PROVNS $GRAFANA_PW
p8sinstchk=`ssh provbee-service busybee tobs install_chk`
grafanapw=`ssh provbee-service busybee tobs passwd $PROVNS`
cat /tmp/$provbeetmp.base64 >> /tmp/klevr_debug
echo "\n\n" >> /tmp/klevr_debug

TASK_RESULT=$(echo "{}" | jq '. += {"P8S_INSTALL": "'"$p8sinstchk"'"}')

echo TASK_RESULT=${TASK_RESULT} >> /tmp/klevr_debug

################## NEW
#ssh provbee-service "echo $TOBSYAML > /tmp/$provbeetmp.base64"
#tobs_svc=$(ssh provbee-service busybee tobs install $PROVNS $provbeetmp)
#TASK_RESULT=$(echo "$tobs_svc")
