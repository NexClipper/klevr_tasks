JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
ALTCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.alt_config_apply')
#alertmanager_config_apply=`ssh provbee-service busybee p8s cm $PROVNS apply alertmanager $ALTCONFALY`
#TASK_RESULT=$(echo "{}" | jq '. += {"Alertmanager_config_apply": "'"$alertmanager_config_apply"'"}')
