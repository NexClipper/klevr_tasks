JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
GET_NS=$(echo ${JSON_TASK_PARAMS} | jq -r '.gf_namespace')
GET_AUTHCMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.gf_authcmd')

##### RUN
#GET_JSON=$(ssh provbee-service busybee grafana_auth getkey $GET_NS )
GET_JSON=$(ssh provbee-service busybee grafana_auth $GET_AUTHCMD $GET_NS )

##### INFO
TASK_RESULT=$(echo "$GET_JSON")
