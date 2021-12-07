##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
GET_CMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.metricark_cmd')
GET_PROJNAME=$(echo ${JSON_TASK_PARAMS} | jq -r '.projectName')
GET_DOMAINID=$(echo ${JSON_TASK_PARAMS} | jq -r '.domainId')


#TEST
if [ "$GET_CMD" = "" ]; then GET_CMD="metricark_openstack_nodes"; fi
##### RUN
#GET_JSON=`ssh provbee-service busybee metricark_openstack_nodes pName dId` 
GET_JSON=`ssh provbee-service busybee $GET_CMD $GET_PROJNAME $GET_DOMAINID` 

##### INFO
#TASK_RESULT=$(echo "$GET_JSON")
TASK_RESULT=$GET_JSON
