#!/bin/bash
RUNCMD="ssh provbee-service"
#RUNCMD="kubectl exec -it -n nexclipper provbee --"
runok(){

while :
do
        ruzzz=$((ruzzz+1))

	sshrun=$($RUNCMD busybee beestatus hello)
	echo "count : $ruzzz -> Status : $sshrun"

	if [ "$sshrun" == "hi" ]; then
        	echo "success"
		break
	fi

	if [ $ruzzz == "19" ]; then
		echo "failed. Time Out. restart plz.";exit 1;
	fi

	sleep 3
done
echo "Done!"

}
runok
echo "Next Step!!!!!!"
