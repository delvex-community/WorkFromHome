#!/bin/bash

check_window () {
	new_name=$(xdotool getactivewindow getwindowname)
	if [[ $@ == $new_name ]] 
	then 
		val=1
	else 
		val=0
	fi
}
scroll_up_down () {
	rdm=$(shuf -i 5-59 -n 1)
	rdm=$((SECONDS+rdm))
	while [ $SECONDS -lt $rdm ];
	do
		div=$(( (RANDOM % 4 ) + 1 ))
		res=$(( div % 4 ))
		if [ $res = 0 ]
		then
			xdotool key Next sleep 5	
			for i in `seq 8`; do xdotool click 4 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			for i in `seq 12`; do xdotool click 4 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			xdotool key Next 	
			sleep $( shuf -i 2-10 -n 1 ) 
		
		elif [ $res = 1 ]
		then
			xdotool key Next sleep 6
			for i in `seq 12`; do xdotool click 5 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			for i in `seq 8`; do xdotool click 5 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			xdotool key Prior
			sleep $( shuf -i 2-10 -n 1 ) 
							
		elif [ $res = 2 ]
		then
			for i in `seq 14`; do xdotool click 5 sleep  0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			for i in `seq 16`; do xdotool click 5 sleep  0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			xdotool key Prior
			sleep $( shuf -i 2-10 -n 1 ) 
		else		
			for i in `seq 13`; do xdotool click 4 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			for i in `seq 3`; do xdotool click 5 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			for i in `seq 15`; do xdotool click 4 sleep 0.8; done
			sleep $( shuf -i 2-10 -n 1 ) 
			xdotool key Next sleep 4 key Next
			sleep $( shuf -i 2-10 -n 1 ) 
		fi
	done
}
firefox & sleep 5
for i in {1..4}
do
	firefox -url 'google.com'
	sleep 2
	if [ $i = 1 ] 
	then
		xdotool key F11 sleep 2 
	fi
	xdotool mousemove 802 342 click 1
	xdotool type 'how to implement ' 
	sleep 2
	y=$(( 350 + $i*30 ))
	xdotool mousemove 890 $y  click 1 sleep 2
	xdotool mousemove 240 145 click 1 sleep 1
	window_name=$(xdotool getactivewindow getwindowname)
	val=1
	while [ $val -eq 1 ] 
	do
		xdotool click 5 click 1 sleep 0.5
		check_window "$window_name"
	done
	sleep 4
	scroll_up_down
done

while :
do
	rdmint=$(shuf -i 1-4 -n 1)
	if [ $rdmint = 1 ]
	then
		xdotool key Control_L+Tab
		scroll_up_down
	elif [ $rdmint = 2 ]
	then
		xdotool key Control_L+Tab+Tab
		scroll_up_down
	else
		xdotool key Control_L+Tab+Tab+Tab
		scroll_up_down
	fi
done
