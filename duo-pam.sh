#!/bin/bash

set -e

# To setup MFA on Debian/Ubuntu servers (including Raspberry Pi):
# Source: https://duo.com/docs/duounix

sudo apt update && sudo apt install -y 
	libssl-dev \
	libpam-dev 
	wget \
	curl

wget https://dl.duosecurity.com/duo_unix-latest.tar.gz
tar zxf duo_unix-latest.tar.gz
cd duo_unix-1.10.1
./configure --with-pam --prefix=/usr && make && sudo make install

# edit pam_duo.conf (usually in /etc/duo or /etc/security) to add duo integration key, secret key, API hostname:
#	[duo]
#	; Duo integration key
#	ikey = INTEGRATION_KEY
#	; Duo secret key
#	skey = SECRET_KEY
#	; Duo API hostname
#	host = API_HOSTNAME

# optionally, for SSH public key authentication, edit sshd_config file (usually in /etc or /etc/ssh)
# 	PubkeyAuthentication yes
# 	PasswordAuthentication no
# 	AuthenticationMethods publickey,keyboard-interactive

# otherwise, edit /etc/pam.d/sshd to add:
sudo echo "auth required pam_duo.so" >> /etc/pam.d/sshd
sudo echo "UsePAM yes" >> /etc/ssh/sshd_config
sudo echo "ChallengeResponseAuthentication yes" >> /etc/ssh/sshd_config
sudo echo "UseDNS no" >> /etc/ssh/sshd_config
