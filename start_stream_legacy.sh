#!/bin/bash

echo started script from reboot on $(date) >> /home/pi/Desktop/stream_settings/stream_output.txt
echo 

running=true

if pgrep darkice; then
    echo ########
    echo another instance of darkice found, stopping script.
    echo ########
    #running=false

else
    echo no instance of darkice running.
    echo reconnect script initialised, running loop.
    lastSeconds=0
    currentSeconds=0
    failedTries=0
fi

while [ $running = true ]; do
        date >> /home/pi/Desktop/stream_settings/stream_output.txt
        echo >> /home/pi/Desktop/stream_settings/stream_output.txt
	lastseconds=$(date +%s)
        sudo darkice -c /home/pi/Desktop/stream_settings/stream_configuration.cfg >> /home/pi/Desktop/stream_settings/stream_output.txt
        if [ $(($(date +%s)-$lastseconds)) -lt 20 ]; then
            if grep ON /home/pi/Desktop/stream_settings/soundcamp_scripts/darkice_reboot.txt; then    
		failedTries="$((failedTries+1))"
		echo Darkice failed, under 60 secs. It has failed $failedTries times, will reboot at 5 failed tries. >> /home/pi/Desktop/stream_settings/stream_output.txt
	    fi
        else
            failedTries=0
        fi
        if [ $failedTries -gt 5 ]; then
	    sudo reboot
        fi
        echo ######## >> /home/pi/Desktop/stream_settings/stream_output.txt
        echo darkice crashed, retrying in 30 seconds. >> /home/pi/Desktop/stream_settings/stream_output.txt
        echo ######## >> /home/pi/Desktop/stream_settings/stream_output.txt
	sleep 30

done
