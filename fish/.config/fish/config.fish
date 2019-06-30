set -xg GOPATH $HOME/go
set -xg PATH /usr/local/go/bin $PATH $GOPATH/bin
set -xg PATH /snap/bin $PATH

abbr -a g git
abbr -a k kubectl
abbr -a kk kubekit
