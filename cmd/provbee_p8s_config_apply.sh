JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
PROMCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.prom_config_apply')
#prometheus_config_apply=`ssh provbee-service busybee p8s cm $PROVNS apply prometheus $PROMCONFALY`
#TASK_RESULT=$(echo "{}" | jq '. += {"Prometheus_config_apply": "'"$prometheus_config_apply"'"}')
