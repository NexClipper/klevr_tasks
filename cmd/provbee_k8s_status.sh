JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
k8s_status=`ssh provbee-service busybee k8s wow $PROVNS` 
TASK_RESULT=$(echo ${k8s_status})
