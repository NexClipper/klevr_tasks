##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
GET_NS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
GET_CMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.metricark_cmd')
GET_APP=$(echo ${JSON_TASK_PARAMS} | jq -r '.metricark_app')


#TEST
if [ "$GET_CMD" = "" ]; then GET_CMD="metricark"; fi
##### RUN
#GET_JSON=`ssh provbee-service busybee metricark services/nodes/pods` 
GET_JSON=`ssh provbee-service busybee $GET_CMD $GET_APP` 

##### INFO
#TASK_RESULT=$(echo "$GET_JSON")
TASK_RESULT=$GET_JSON
