#!/bin/bash

# Run by crontab every minute

if fping google.com | grep alive; then
        exit
else
        sudo ifdown --force wlan0
        sudo ifup wlan0
        sleep 10
        sudo killall darkice
        sh /boot/SETUP/system/write_ip.sh
        echo "Reconnected wifi and stopped Darkice on $(date)" >> /boot/SETUP/logs/wifi_reco$
fi

