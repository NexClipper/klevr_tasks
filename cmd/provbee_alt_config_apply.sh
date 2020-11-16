JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
ALTCONFALY=$(echo ${JSON_TASK_PARAMS} | jq -r '.alt_config_apply')
provbeetmp="Nex-alt_config.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | sed 1q)"
ssh provbee-service "echo $ALTCONFALY > /tmp/$provbeetmp.base64"
alertmanager_config_apply=`ssh provbee-service busybee p8s cm $PROVNS apply alertmanager $provbeetmp`
TASK_RESULT=$(echo "{}" | jq '. += {"Alertmanager_config_apply": "'"$alertmanager_config_apply"'"}')
