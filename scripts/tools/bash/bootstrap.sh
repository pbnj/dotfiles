#!/bin/bash

set -e
set -x

if [ -z "$1" ]; then
  echo "usage: $0 <username>"
  exit 1
fi

user=$1

useradd               \
  --shell /bin/bash   \
  --create-home       \
  --groups sudo       \
  $user

passwd -d $user

mkdir -p "/home/$user/.ssh"

# Add public ssh key to authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCs33tqPskjjhxqyHtPmAhzX0AyILXkPwu1dBwUfMiK1xnnczePFdvEkB9sJblMqFuH+BovC+hgr6vswzIjoLU53PxxUm2NexG3TZzEVQNafufEF6uba5Pj/Pi9J8qmpSXf89/3pQgGA7IZfNkKAXeAhAunDU2k0Pd7h/Wx2AMZfExX9QFNmjimk9kbbO+pnujioBXLpmTEnmv7T4vF/F2hPLXSgZlXN9StN1hqDIUnwd3+M0pYcJYIioEbwaEWot2vbJNqEJ23A66T9cDywFVtnstZutw/ehkvl6JURw9jbQ8npg9cFx3DYJUn1Vg7+7WETu3jOQdrZaFIo/pTMgJVu1WWZBQ6nSS3BR3gTz2qEb2gbliCpX1kdq34TONByrisRbqSuTopBKVLauNF+a/nYGqa3Pbpb12x43sopaSj94RE9japZmqMVO19rWCUx5CXxtKMGy+inGZSCm2uhKFS0tLrdmaXUH/gIMitcOOhTlYjNZwSRz8JV6IvwOvHcFulUkIH8+ssI3j7rCUPeGH1rxAGQRVX6nLxqQ6GKyeRvkMdQX6UgkpPkyT+lpVG9L7Px8da++lY0bNt9RkFyVoBMe83mEqYkvY/4IZN3O4kzZPVi0NHFEw08D07w9DvDT4bmic0zZclcK0rpe8ZBI/nVbZ8kOpfRKDZyK9yF0z0Hw==" >> "/home/$user/.ssh/authorized_keys"

chown -R $user:$user /home/$user
chmod 700 /home/$user/.ssh
chmod 600 /home/$user/.ssh/authorized_keys

sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

command -v systemctl &>/dev/null && systemctl restart sshd.service
command -v service &>/dev/null && service ssh restart

echo "ALL            ALL = (ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo
