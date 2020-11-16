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
provbeetmp="NexClipper.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
echo "provbeetmp=${provbeetmp}\n\n" >> /tmp/klevr_debug

ssh provbee-service "echo $TOBSYAML > /tmp/$provbeetmp.base64"
cat /tmp/$provbeetmp.base64 >> /tmp/klevr_debug
echo "\n\n" >> /tmp/klevr_debug

ssh provbee-service busybee tobs install $PROVNS $provbeetmp
#ssh provbee-service kubectl patch service -n $PROVNS nc-grafana -p '{\"spec\":{\"type\":\"NodePort\"}}'
######TEST INFO
grafanapw=`ssh provbee-service busybee tobs passwd $PROVNS $GRAFANA_PW`
grafanainfo=`ssh provbee-service busybee nodesearch nc-grafana`
TASK_RESULT=$(echo "{}" | jq '. += {"GRAFANA_URL": "'"$grafanainfo"'", "GRAFANA_PW_CHANGE": "'"$grafanapw"'"}')

echo TASK_RESULT=${TASK_RESULT} >> /tmp/klevr_debug
