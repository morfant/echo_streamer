#!/bin/bash

# This script is run from the sudo crontab
# Access it by running sudo crontab -e

if ! pgrep darkice; then # if another darkice process is not currently running
    if grep ON /boot/SETUP/stream_switch.txt; then # if /boot switch is on
	echo "#### Restarted Stream ####" >> /boot/SETUP/logs/stream_output.txt
        date >> /boot/SETUP/logs/stream_output.txt
        sudo darkice -c /boot/SETUP/stream_configuration.cfg >> /boot/SETUP/logs/stream_output.txt    
    fi
else
    if ! grep ON /boot/SETUP/stream_switch.txt; then # if darkice is running and switch is off
	sudo killall darkice
	echo "#### Stream switch detected OFF, stopping stream ####" >> /boot/SETUP/logs/stream_output.txt
    fi
fi
