#!/bin/bash

# https://www.howtoforge.com/tutorial/how-to-setup-automatic-security-updates-on-ubuntu-1604/

set -e
set -x

sudo apt-get update
sudo apt-get install -y unattended-upgrades

echo "## Configuration"
sudo vim /etc/apt/apt.conf.d/50unattended-upgrades
