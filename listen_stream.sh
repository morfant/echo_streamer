#!/bin/bash

# This script is run from the sudo crontab
# Access it by running sudo crontab -e

echo "####### play stream! #######"
mpc play # Need to add proper stream url to mpc playlist (ex: mpc add http://locus.creacast.com:9001/weatherreport_echo_1.mp3)
