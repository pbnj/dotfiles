# exports
set -gx VAULT_ADDR "https://vault.0.ecc.auw2.zuora"
set -gx VAULT_SKIP_VERIFY "true"
set -gx GITHUB_API_TOKEN "3e674126e14c5fdf0fc5543df7ab53f78032a6f8"
set -gx GITLAB_PRIVATE_TOKEN "ZssLkC48TFT4fu1KfxQD"
set -gx NPM_TOKEN "gG-jz8iCiwiQ-Z1EkKPy"
set -gx WORK "$HOME/Work/gitlab.zeta.tools"
set -gx TOOLS "$WORK/tools"
set -gx TECHOPS "$WORK/techops"
set -gx SECURITY "$WORK/security"
set -gx KUBECONFIGS "$HOME/.kube/configs"

# glab
function gl
  set -lx GITLAB_HOST gitlab.zeta.tools
  glab $argv
end

# drawio
function drawio
	open -a draw.io.app $argv
end

################################################################################
# VPN
################################################################################

function vpn_up
	if ! op get totp zuora-int &>/dev/null
		eval (op signin)
	end
	echo -e 3\n(op get item zuora-int --fields=username)\n(op get item zuora-int --fields=password)\n(op get totp zuora-int) | /opt/cisco/anyconnect/bin/vpn connect vpn.zuora.com -s
EOF
end

function vpn_down
	/opt/cisco/anyconnect/bin/vpn disconnect
end

function vpn_reload
	vpn_down
	vpn_up
end

################################################################################
# OKTA
# Usage: okta -P/--profile [-t/--token] [-u/--user] [-p/--password]
################################################################################

function okta --description "Wrapper to integrate OKTA CLI with 1Password"
  set -l options (fish_opt --short=h --long=help)
  set options $options (fish_opt --short=P --long=profile --required-val)
  set options $options (fish_opt --short=t --long=token --optional-val)
  set options $options (fish_opt --short=u --long=user --optional-val)
  set options $options (fish_opt --short=p --long=password --optional-val)

  argparse --name=okta $options -- $argv
  or return

  if set -q _flag_help
    echo "Usage: okta -P/--profile [-t/--token] [-u/--user] [-p/--password]"
    return
  end

  set -lx AWS_PROFILE $_flag_profile
  set -lx MFA_TOKEN
  set -lx OKTA_USER
  set -lx OKTA_PASS

  set -lx OKTA_CREDS (op get item zuora)

  if test -z $OKTA_CREDS
    eval (op signin)
    set OKTA_CREDS (op get item zuora)
  end

  if set -q _flag_token
    set MFA_TOKEN $_flag_token
  else
    echo "# Getting MFA_TOKEN from 1password"
    set MFA_TOKEN (op get totp zuora)
  end

  if set -q _flag_user
    set OKTA_USER $_flag_user
  else
    echo "# Getting OKTA_USER from 1password"
    set OKTA_USER (echo $OKTA_CREDS | jq '.details.fields[] | select(.name == "username").value')
  end

  if set -q _flag_pass
    set OKTA_PASS $_flag_pass
  else
    echo "# Getting OKTA_PASS from 1password"
    set OKTA_PASS (echo $OKTA_CREDS | jq '.details.fields[] | select(.name == "password").value')
  end

  docker run \
    --rm \
    -it \
    -v "$HOME/.aws:/root/.aws" \
    -v "$HOME/.okta-aws-login/config.properties:/config.properties" \
    registry.zeta.tools/security/okta-aws-login:latest \
      --profile $AWS_PROFILE \
      --username $OKTA_USER \
      --password $OKTA_PASS \
      --2fa-type google \
      --2fa-token $MFA_TOKEN
end

################################################################################
# ZORDON
################################################################################

function zordon_exports
	set -lx ZORDON_CREDS (op get item zordon.zeta.tools)

	if test -z $ZORDON_CREDS
		eval (op signin)
		set -l ZORDON_CREDS (op get item zordon.zeta.tools)
	end

	echo set -gx ZORDON_USER (echo $ZORDON_CREDS | jq '.details.fields[] | select(.name == "username").value')
	echo set -gx ZORDON_PASS (echo $ZORDON_CREDS | jq '.details.fields[] | select(.name == "password").value')
	echo set -gx ZORDON_URL "https://zordon.zeta.tools"
end
