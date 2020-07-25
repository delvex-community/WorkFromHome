#!/bin/bash
echo Lets get automated!!
typing()
{
        xdotool type --delay 100 "Today we will not work from home"
        sleep 1
        xdotool type --delay 100 "We will eat fivestar and do nothing"
        sleep 1
        xdotool type --delay 100 "And xdotool is at your service"
       sleep 1
        xdotool type --delay 100 "You are the master and i am your servent"
        sleep 1
        xdotool type --delay 100 "Take a break have a kitkat"
        sleep 4
}
browse()
{
        xdotool type "let us browse"
        /usr/bin/firefox --search "indian army" &
        sleep 10
        /usr/bin/firefox --new-tab http://www.yahoo.com &
        sleep 10
        /usr/bin/firefox --new-tab http://www.facebook.com &
        sleep 10
        q=$(xdotool search --onlyvisible firefox)
        sleep 10
        xdotool windowkill $q
        sleep 3
}
textedit()
{
gedit &
sleep 1
q=$(xdotool search --onlyvisible gedit)
typing
xdotool mousemove --window $q 0 0 click 1; xdotool mousedown 1;xdotool mousemove 10 10;xdotool mouseup 1
sleep 3
xdotool windowkill $q
sleep 3
}


mouseclick()
{

for i in {50,100,150,200,250,300,350}
do
        xdotool mousemove 45 $i
        sleep 2
        xdotool click "3"
        sleep 2
        xdotool click "1"
done
sleep 3

}

while :
do
        browse
        textedit
        mouseclick
done

