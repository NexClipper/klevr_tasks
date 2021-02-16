JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
p8s_status=`ssh provbee-service busybee p8s wow $PROVNS` 
TASK_RESULT=$(echo ${p8s_status})
