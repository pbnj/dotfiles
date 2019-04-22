#!/bin/bash

set -e

# To setup MFA on Debian/Ubuntu servers (including Raspberry Pi):
# Source: https://duo.com/docs/duounix

sudo apt update && sudo apt install -y \
    build-essential \
    libssl-dev \
    libpam-dev \
    wget \
    curl

wget https://dl.duosecurity.com/duo_unix-latest.tar.gz
tar zxf duo_unix-latest.tar.gz
cd duo_unix-latest

./configure --with-pam --prefix=/usr && make && sudo make install

rm -rf duo_unix*

# edit pam_duo.conf (usually in /etc/duo or /etc/security) to add duo integration key, secret key, API hostname:
#   [duo]
#   ; Duo integration key
#   ikey = INTEGRATION_KEY
#   ; Duo secret key
#   skey = SECRET_KEY
#   ; Duo API hostname
#   host = API_HOSTNAME

# optionally, for SSH public key authentication, edit sshd_config file (usually in /etc or /etc/ssh)
#   PubkeyAuthentication yes
#   PasswordAuthentication no
#   AuthenticationMethods publickey,keyboard-interactive

# otherwise, edit /etc/pam.d/sshd to add:
sudo -i echo "auth required /lib64/security/pam_duo.so" >> /etc/pam.d/sshd # sometimes pam_duo.so is in /lib64/security instead of lib/security
sudo -i echo "UsePAM yes" >> /etc/ssh/sshd_config
sudo -i echo "ChallengeResponseAuthentication yes" >> /etc/ssh/sshd_config
sudo -i echo "UseDNS no" >> /etc/ssh/sshd_config
