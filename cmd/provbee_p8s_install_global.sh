JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
TOBSYAML=$(echo ${JSON_TASK_PARAMS} | jq '.tobs_yaml')
GLOBALINST=$(echo ${JSON_TASK_PARAMS} | jq '.p8s_install_global')

#OLD
GRAFANA_PW=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_credential')


echo "JSON_TASK_PARAMS=${JSON_TASK_PARAMS}\n" > /tmp/klevr_debug
echo "PROVNS=${PROVNS}\n" >> /tmp/klevr_debug
echo "TOBSYAML=${TOBSYAML}\n" >> /tmp/klevr_debug
echo "GRAFANA_PW=${GRAFANA_PW}\n\n\n" >> /tmp/klevr_debug

#helm test
##### RUN
if [[ $GLOBALINST == "Y" ]]; then globalview="_GLOBAL";fi
provbeetmp="NexClipper${globalview}.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
echo "provbeetmp=${provbeetmp}\n\n" >> /tmp/klevr_debug

ssh provbee-service "echo $TOBSYAML > /tmp/$provbeetmp.base64"
tobs_svc=$(ssh provbee-service busybee tobs install $PROVNS $provbeetmp)
TASK_RESULT=$(echo "$tobs_svc")
