##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
PROMCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_config_yaml')

##### RUN
provbeetmp="Nex-prom_config.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $PROMCONFALY > /tmp/$provbeetmp.base64"
prometheus_config_apply=`ssh provbee-service busybee p8s cm $PROVNS apply prometheus $provbeetmp`

##### INFO
TASK_RESULT=$(echo "{}" | jq '. += {"P8S_CONFIG_YAML": "'"$prometheus_config_apply"'"}')
