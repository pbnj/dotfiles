set -l GO_LATEST "go1.9.4"

set -l GO_ARCH "linux-amd64.tar.gz"
if [ (uname) = "Darwin" ]
    set GO_ARCH "darwin-amd64.pkg"
end

echo "## CREATING GO WORKSPACE..."
mkdir -p $HOME/src
mkdir -p $HOME/bin

echo "## INSTALLING LATEST GO..."
wget https://storage.googleapis.com/golang/$GO_LATEST.$GO_ARCH
if [ (uname) = "Darwin" ]
    open $GO_LATEST.$GO_ARCH
else
    sudo tar -C /usr/local -xzf $GO_LATEST.$GO_ARCH
end

echo "## FINISHED INSTALLING GO!"

