#!/bin/bash

open_firefox()
{
firefox $1 &
sleep 7
firefoxid=`xdotool search --sync --name firefox`
xdotool windowfocus $firefoxid
xdotool key ctrl+l
sleep 2
xdotool type "$2"
sleep 1
xdotool key KP_Enter
xdotool windowminimize $firefoxid
xdotool windowkill $firefoxid
}

gedit_type_text()
{
	if [ -f /tmp/automatedtext ]
	then
		rm -f /tmp/automatedtext
	fi
	gedit /tmp/automatedtext &
	sleep 2
	editorid=`xdotool search --name automated`
	xdotool windowsize --sync  $editorid 50% 70%
	xdotool mousemove 150 150
	xdotool click 1
	xdotool type "hello pykid" && xdotool key KP_Enter
	for i in {1..9}
	do
		xdotool type "working in loop" && xdotool key KP_Enter
		sleep 1
		if [ $i -eq 5 ]
		then
			xdotool windowminimize --sync $editorid
			sleep 3
			xdotool windowactivate --sync $editorid
			xdotool type --delay 30 "Hey working From home over issue #1 " && xdotool key KP_Enter
		fi
		sleep 1
	done
	xdotool key ctrl+s
	sleep 2
	xdotool windowkill $editorid
}

moving_window()
{
	if [ -d /tmp/car1 ]
	then 
		rmdir /tmp/car1
	fi
	mkdir /tmp/car1
	nautilus /tmp/car1 &
	sleep 2
	car=`xdotool search --name car`
	xdotool windowsize --sync $car 30% 30%
	# l ~> r
	for((i=10;i<1000;i+=5))
	do
		xdotool windowmove --sync $car $i 100
	done
	# u ~> d
	for((i=100;i<691;i+=5))
	do
		xdotool windowmove --sync $car 995 $i
	done
	# r ~> l
	for((i=1000;i>100;i-=5))
	do
		xdotool windowmove --sync $car $i 690
	done
	# d ~> u
	for((i=690;i>=100;i-=5))
	do
		xdotool windowmove --sync $car 170 $i
	done
	xdotool windowsize --sync $car 90% 100%
	sleep 1
	xdotool windowkill $car
}

if [ $# == "0" ]
then
	echo "will be running for minimum 1 minute by default"
	runtime="1 minute"
else
	runtime=$1
fi

if [ $1 == "--help" ]
then
	echo "desktop_automation 5 minute (minimum minutes to run for)"
	exit
fi



echo "starting automation script"
endtime=$(date -ud "$runtime" +%s)
while [[ $(date -u +%s) -le $endtime ]]
do
	open_firefox https://www.google.com https://www.facebook.com
	sleep 3
	gedit_type_text
	sleep 2
	moving_window
	sleep 1
	open_firefox https://www.linkedin.com https://www.google.com
	sleep 2
done
echo "Hope I would have been of your help"
