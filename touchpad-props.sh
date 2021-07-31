#!/bin/bash

#make executable: sudo chmod +x touchpad-props.sh
#script might need changes depending on your setup

tpadid=$(xinput list | grep 'Touchpad' | awk {'print$6'} | awk {'print substr($0,4)'})
teprop=$(xinput list-props $tpadid | grep 'Tapping Enabled' | head -1 | awk {'print $4'} | cut -d "(" -f2 | cut -d ")" -f1)
dwtprop=$(xinput list-props $tpadid | grep 'Disable While Typing' | head -1 | awk {'print $6'} | cut -d "(" -f2 | cut -d")" -f1)

xinput set-prop $tpadid $teprop 1
xinput set-prop $tpadid $dwtprop 0
