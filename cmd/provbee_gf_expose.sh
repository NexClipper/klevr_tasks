JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
ssh provbee-service kubectl patch service -n $PROVNS nc-grafana -p '{\"spec\":{\"type\":\"NodePort\"}}'
grafanainfo=`ssh provbee-service busybee nodesearch nc-grafana`
TASK_RESULT=$(echo "{}" | jq '. += {"GRAFANA_URL": "'"$grafanainfo"'"}')
