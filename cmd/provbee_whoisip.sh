##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
GETJOB=$(echo ${JSON_TASK_PARAMS} | jq -r '.provbee_job')

#TEST
if [ "$GETJOB" = "" ]; then GETJOB="whoisip"; fi
##### RUN
whoisip =`ssh provbee-service busybee $GETJOB

##### INFO
TASK_RESULT=$whoisip
