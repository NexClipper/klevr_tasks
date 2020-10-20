#sample 커맨드 입력 양식(form)
name: "provbee_host"
description: "PROVBEE 호스트명"
data type: "text"


#sample JSON 파라미터
{
  "provbee_host": "provbee",
  "P8S_INIT_GIT_URL": "https://github.com/ggamdi/nex-prometheus.git",
  "PROVBEE_P8S_PATH": "/data/klevry/kube-prometheus"
}


#Global 파라미터 JSON 파싱
JSON_TASK_PARAMS=#${TASK_ORIGIN_PARAM} 파라미터 JSON으로 파싱
JSON_PRE_STEP_RESULT=#${TASK_RESULT} 파라미터 JSON으로 파싱(JSON을 기본 포맷으로 하되 필수는 아님. 각 STEP에서는 이전의 RESULT가 어떤 데이터 포맷인지 알고 있다는 전제에 사용)


#JSON 데이터로부터 local 변수 선언
SSH_HOST=JSON_TASK_PARAMS.provbee_host                #provbee
P8S_INIT_GIT_URL=JSON_TASK_PARAMS.p8s_init_git_url    #https://github.com/ggamdi/nex-prometheus.git
PROVBEE_P8S_PATH=JSON_TASK_PARAMS.provbee_p8s_path    #/data/klevry/kube-prometheus


#helm test
ssh {} git clone ${P8S_INIT_GIT_URL} ${PROVBEE_P8S_PATH}
bash ${PROVBEE_CMD_PATH}/cmd/promoperchk.sh 
busybee nodesearch grafana > /tmp/grafana
