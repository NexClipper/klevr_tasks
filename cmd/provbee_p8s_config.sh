##### JSON
JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
PROMCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_config_yaml')
GETCMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_config_cmd')
GETCONFNAME=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_config_name')


#p8s_config_cmd = get / test / apply
#p8s_config_name = recording_rules / alerting_rules / prometheus / alertmanager

##### RUN
provbeetmp="Nex-p8sconf_$GETCONFNAME.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $PROMCONFALY > /tmp/$provbeetmp.base64"
p8s_config_json=`ssh provbee-service busybee p8s cm $PROVNS $GETCMD $GETCONFNAME $provbeetmp`

##### INFO
TASK_RESULT=$(echo "$p8s_config_json")
#TASK_RESULT=$(echo "{\"P8S_CONFIG_YAML\":${p8s_config_json}}")
