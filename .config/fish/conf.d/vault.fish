# Vault
set -x VAULT_ADDR ""

if type -q vault
  abbr -a v 'vault'
  abbr -a  vl "vault login -method=ldap username=$USER"
  # abbr -a vss "vault write -field=signed_key ssh-client-signer/sign/$USER public_key=@$HOME/.ssh/id_rsa.pub > $HOME/.ssh/id_rsa-cert.pub"
  abbr -a vsl "vault secrets list"
end

function install_vault
  echo "# INSTALLING VAULT"

  set -l VAULT_VERSION ""

  if [ $argv[1] ]; set VAULT_VERSION $argv[1]; end

  if [ $VAULT_VERSION = "" ]; echo "Please, specify version to install."; exit 1; end

  set -l VAULT_ARCH "linux_amd64.zip"
  if [ (uname) = "Linux" ]
    set VAULT_ARCH "darwin_amd64.zip"
  end

  set -l VAULT_BINARY "vault_{$VAULT_VERSION}_{$VAULT_ARCH}"
  echo "## DOWNLOADING VAULT $VAULT_BINARY"

  curl -o $VAULT_BINARY https://releases.hashicorp.com/vault/$VAULT_VERSION/$VAULT_BINARY

  unzip $VAULT_BINARY

  sudo mv vault /usr/local/bin/
  echo "## FINISHED INSTALLING VAULT"
end
