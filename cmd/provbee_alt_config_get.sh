JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
alertmanager_config=`ssh provbee-service busybee p8s cm $PROVNS get alertmanager`
TASK_RESULT=$(echo "{}" | jq '. += {"AM_CONFIG_YAML": "'"$alertmanager_config"'"}')
