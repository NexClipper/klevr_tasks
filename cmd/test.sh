##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
GETJOB=$(echo ${JSON_TASK_PARAMS} | jq -r '.provbee_job')
#GETJOB = xxx, zzz


##### RUN

test_svc=`ssh provbee-service busybee $GETJOB`


##### INFO
##########TEST
TASK_RESULT=$(echo "$test_svc")
