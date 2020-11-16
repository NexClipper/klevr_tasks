JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
TOBSYAML=$(echo ${JSON_TASK_PARAMS} | jq '.tobs_yaml')
GRAFANA_PW=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_credential')

#helm test
provbeetmp="NexClipper.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $TOBSYAML > /tmp/$provbeetmp.base64"
ssh provbee-service busybee tobs install $PROVNS $provbeetmp
#ssh provbee-service kubectl patch service -n $PROVNS nc-grafana -p '{\"spec\":{\"type\":\"NodePort\"}}'
######TEST INFO
grafanapw=`ssh provbee-service busybee tobs passwd $PROVNS grafana $GRAFANA_PW`
grafanainfo=`ssh provbee-service busybee nodesearch nc-grafana`
TASK_RESULT=$(echo "{}" | jq '. += {"GRAFANA_URL": "'"$grafanainfo"'", "GRAFANA_PW_CHANGE": "'"$grafanapw"'"}')
