JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
GET_NS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
GET_CMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.charts_cmd')
GET_APP=$(echo ${JSON_TASK_PARAMS} | jq -r '.charts_app')
GET_YAML=$(echo ${JSON_TASK_PARAMS} | jq '.charts_yaml')
GET_TYPE=$(echo ${JSON_TASK_PARAMS} | jq -r '.charts_svc_type')
if [ "$GET_YAML" = "" ]; then GET_YAML="" ; fi
if [ "$GET_TYPE" = "" ]; then GET_TYPE="" ; fi

#helm test
##### RUN
GET_TMP="Nex_charts.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $GET_YAML > /tmp/$GET_TMP.base64"
GET_JSON=$(ssh provbee-service busybee charts $GET_CMD $GET_NS $GET_APP $GET_TMP $GET_TYPE)
#tobs_svc=$(ssh provbee-service busybee tobs install $PROVNS $provbeetmp)


##### INFO
TASK_RESULT=$(echo "$GET_JSON")
