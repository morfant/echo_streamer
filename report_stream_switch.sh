#!/bin/bash

#This is run from init.d startup script

if grep "ON" /boot/SETUP/stream_switch.txt; then
	echo "#### Stream switch detected ON, starting stream ####" >> /boot/SETUP/logs/stream_output.txt
else 
	echo "#### Stream switch detected OFF, not starting stream ####" >> /boot/SETUP/logs/stream_output.txt
fi
