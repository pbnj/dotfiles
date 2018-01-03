SSH_AGENT=$(which ssh-agent)
[ -n "$SSH_AUTH_SOCK" ] && $SSH_AGENT -k
