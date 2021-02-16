#!/bin/bash
RUNCMD="ssh provbee-service"
#RUNCMD="kubectl exec -it -n nexclipper provbee --"
runok(){
sshrun=$($RUNCMD busybee beestatus hello)
while [[ $sshrun == "hi" ]];
do
        ruzzz=$((ruzzz+1))
        echo "count : $ruzzz -> Status : $sshrun"
        sshrun=$($RUNCMD busybee beestatus hello)
        sleep 3
        if [ $ruzzz == "99" ]; then echo "failed. Time Out. restart plz.";exit 1; fi
done
echo "Done!"
}
runok
echo "Next Step!!!!!!"
