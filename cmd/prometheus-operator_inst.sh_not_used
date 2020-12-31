#!/bin/bash
RUNCMD="ssh provbee-service"
#RUNCMD="kubectl exec -it -n nexclipper provbee --"

$RUNCMD git clone https://github.com/NexClipper/kube-prometheus_test.git /data/klevry/kube-prometheus
$RUNCMD kubectl apply -f /data/klevry/kube-prometheus/setup
$RUNCMD bash /data/klevry/kube-prometheus/chktest.sh
$RUNCMD kubectl apply -f /data/klevry/kube-prometheus/
$RUNCMD bash /data/klevry/kube-prometheus/chktest.sh
ZZZ=$($RUNCMD busybee nodesearch grafana)
echo $ZZZ
