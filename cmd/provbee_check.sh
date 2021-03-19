#!/bin/bash
RUNCMD="ssh provbee-service"
sshrun=$($RUNCMD busybee beestatus hello)
runok(){

while [[ $sshrun != "hi" ]];
do
        ruzzz=$((ruzzz+1))
	echo "count : $ruzzz -> Status : $sshrun"
	sleep 3
	sshrun=$($RUNCMD busybee beestatus hello)
	if [ $ruzzz == "19" ]; then echo "failed. Time Out. restart plz.";exit 1;fi

done
echo "Done!"

}
runok
echo "Next Step!!!!!!"
