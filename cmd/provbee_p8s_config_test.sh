##p8s conf test
###############################
###### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
PROMCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_config_yaml')

###### RUN
provbeetmp="Nex-prom_config_test.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $PROMCONFALY > /tmp/$provbeetmp.base64"
ssh provbee-service busybee p8s cm $PROVNS test prometheus $provbeetmp
#prometheus_config_test=`ssh provbee-service busybee p8s cm $PROVNS get prometheus`

###### INFO
TASK_RESULT=$(echo "{}" | jq '. += {"P8S_CONFIG_YAML_TEST": "'"$prometheus_config_test"'"}')
