##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
GET_CMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.metricark_cmd')
GET_PROMQL=$(echo ${JSON_TASK_PARAMS} | jq -r '.metricark_promql')
GET_ENDPOINT=$(echo ${JSON_TASK_PARAMS} | jq -r '.metricark_endpoint')


#TEST
if [ "$GET_CMD" = "" ]; then GET_CMD="metricark_promql"; fi
##### RUN
#GET_JSON=`ssh provbee-service busybee metricark_promql sum%28kube_node_status_condition%7Bcondition%3D%22Ready%22%2Cstatus%21%3D%22true%22%7D%29 http%3A%2F%2Fnc-prometheus-server.nexclipper.svc.cluster.local` 
GET_JSON=`ssh provbee-service busybee $GET_CMD $GET_PROMQL $GET_ENDPOINT` 

##### INFO
#TASK_RESULT=$(echo "$GET_JSON")
TASK_RESULT=$GET_JSON
