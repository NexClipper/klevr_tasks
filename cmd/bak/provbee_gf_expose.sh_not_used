JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####### JSON
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
GRAFANA_PW=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_credential')
####### RUN
ssh provbee-service kubectl patch service -n $PROVNS nc-grafana -p '{\"spec\":{\"type\":\"NodePort\"}}'
grafanapw=`ssh provbee-service busybee tobs passwd $PROVNS`
grafanainfo=`ssh provbee-service busybee nodesearch nc-grafana`
######## INFO
#TASK_RESULT=$(echo "{}" | jq '. += {"GRAFANA_URL": "'"$grafanainfo"'", "GRAFANA_PW_CHANGE": "'"$grafanapw"'"}')
TASK_RESULT=$(echo "{}" | jq '. += {"GRAFANA_URL": "'"$grafanainfo"'"}')
