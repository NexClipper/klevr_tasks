##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
GETCMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.webstork_cmd')
GETAPP=$(echo ${JSON_TASK_PARAMS} | jq -r '.webstork_app')
GETTYPE=$(echo ${JSON_TASK_PARAMS} | jq -r '.webstork_expose_type')


##### RUN
#provbeetmp="Nex-prom_config.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
#ssh provbee-service "echo $PROMCONFALY > /tmp/$provbeetmp.base64"
webstork_svc=`ssh provbee-service busybee webstork $GETCMD $PROVNS $GETTYPE $GETAPP`

##### INFO
##########TEST
TASK_RESULT=$(echo "{}" | jq '. += {"WEBSTORK_TYPE_STATUS": "'"$webstork_svc"'"}')
