JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
GET_NS=$(echo ${JSON_TASK_PARAMS} | jq -r '.gf_namespace')
GET_GF_JSON=$(echo ${JSON_TASK_PARAMS} | jq -r '.gf_setjson')

GET_JSON=$(ssh provbee-service busybee grafana api $GET_NS $GET_GF_JSON )

##### INFO
TASK_RESULT=$(echo "$GET_JSON")
