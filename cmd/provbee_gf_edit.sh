JSON_TASK_PARAMS=${TASK_ORIGIN_PARAM}
####################################################################
PROVNS=$(echo ${JSON_TASK_PARAMS} | jq -r '.p8s_namespace')
#TOBSYAML=$(echo ${JSON_TASK_PARAMS} | jq '.tobs_yaml')
GETCMD=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_cmd')
GETPW=$(echo ${JSON_TASK_PARAMS} | jq -r '.grafana_credential')

##### RUN
#grafana_svc=`ssh provbee-service busybee tobs $GETCMD $PROVNS $GETPW`
grafana_svc=`ssh provbee-service busybee tobs passwd $PROVNS $GETPW`

## RESULT 
TASK_RESULT=$(echo "$grafana_svc")
