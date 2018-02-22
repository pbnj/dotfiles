# GO
set -x PATH $PATH (go env GOPATH)/bin

function install_go
  echo "## INSTALLING GO"

  set -l GO_VERSION "1.9.4"
  if [ $argv[1] ]
    set GO_VERSION $argv[1]
  end

  set -l GO_ARCH "linux-amd64.tar.gz"
  if [ (uname) = "Darwin" ]
      set GO_ARCH "darwin-amd64.pkg"
  end

  echo "## CREATING GO WORKSPACE..."
  mkdir -p $HOME/src
  mkdir -p $HOME/bin

  set -l GO_BINARY "go$GO_VERSION.$GO_ARCH"
  echo "## DOWNLOADING $GO_BINARY..."
  curl -o $GO_BINARY https://storage.googleapis.com/golang/$GO_BINARY
  if [ (uname) = "Darwin" ]
      open $GO_BINARY
  else
      sudo tar -C /usr/local -xzf $GO_BINARY
  end

  echo "## FINISHED INSTALLING GO!"
end
