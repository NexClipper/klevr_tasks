JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
prometheus_config=`ssh provbee-service busybee p8s cm $PROVNS get prometheus`
TASK_RESULT=$(echo "{}" | jq '. += {"Prometheus_config_get": "'"$prometheus_config"'"}')
