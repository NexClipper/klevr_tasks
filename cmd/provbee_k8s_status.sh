##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
GETJOB=$(echo ${JSON_TASK_PARAMS} | jq -r '.provbee_job')

#TEST
if [[ $GETJOB == "" ]]; then GETJOB="k8s"; fi
##### RUN
#k8s_status=`ssh provbee-service busybee k8s wow $PROVNS` 
k8s_status=`ssh provbee-service busybee $GETJOB wow $PROVNS` 

##### INFO
TASK_RESULT=$k8s_status
