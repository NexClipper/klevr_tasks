## alt conf test
###############################
###### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
PROMCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.am_config_yaml')

###### RUN
provbeetmp="Nex-alt_config_test.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $ALTCONFALY > /tmp/$provbeetmp.base64"
alertmanager_config_test=`ssh provbee-service busybee p8s cm $PROVNS test alertmanager $provbeetmp`

###### INFO
TASK_RESULT=$(echo "{}" | jq '. += {"AM_CONFIG_YAML_TEST": "'"$alertmanager_config_test"'"}')
