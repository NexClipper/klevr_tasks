JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
GET_NS=$(echo ${JSON_TASK_PARAMS} | jq -r '.svc_update_namespace')
GET_APP=$(echo ${JSON_TASK_PARAMS} | jq -r '.svc_update_app')
GET_URL=$(echo ${JSON_TASK_PARAMS} | jq -r '.svc_update_url')
GET_TYPE=$(echo ${JSON_TASK_PARAMS} | jq -r '.svc_update_type')
GET_VERSION=$(echo ${JSON_TASK_PARAMS} | jq -r '.svc_update_version')

GET_JSON=$(ssh provbee-service busybee update $GET_TYPE $GET_NS $GET_APP $GET_URL $GET_VERSION )

##### INFO
TASK_RESULT=$(echo "$GET_JSON")
