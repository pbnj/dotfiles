Vim�UnDo� ��G$S�ҟ+>��nT�Os��6�3�)C��   (       OKTA_PASS="${5}";                             _�S   
 _�                             ����                                                                                                                                                                                                                                                                                                                                                             _�E�    �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �                  #!/bin/bash       okta ()   {       PROFILE="${1}";       TOKEN="${2}";       OKTA_USER="${3}";       OKTA_PASS="${4}";   &    OKTA_CREDS="$(op get item zuora)";   #    if [ -z "${OKTA_CREDS}" ]; then           eval "$(op signin)";   *        OKTA_CREDS="$(op get item zuora)";       fi;        if [ -z "${PROFILE}" ]; then   #        echo "PROFILE is missing.";   /        echo "Usage: __okta <PROFILE> [token]";           return 1;       fi;       if [ -z "${TOKEN}" ]; then   %        TOKEN="$(op get totp zuora)";       fi;   "    if [ -z "${OKTA_USER}" ]; then   i        OKTA_USER="$(echo "${OKTA_CREDS}" | jq '.details.fields[] | select(.name == "username").value')";       fi;   "    if [ -z "${OKTA_PASS}" ]; then   i        OKTA_PASS="$(echo "${OKTA_CREDS}" | jq '.details.fields[] | select(.name == "password").value')";       fi;   �    docker run --rm -it -v "${HOME}/.aws:/root/.aws" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"   }    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               /        echo "Usage: __okta <PROFILE> [token]";5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               .        echo "Usage: _okta <PROFILE> [token]";5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               -        echo "Usage: okta <PROFILE> [token]";5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               ,        echo "Usage: kta <PROFILE> [token]";5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               +        echo "Usage: ta <PROFILE> [token]";5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               *        echo "Usage: a <PROFILE> [token]";5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             _�E�    �               )        echo "Usage:  <PROFILE> [token]";5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �                   �             5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �      	             OKTA_USER="${3}";5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �      
             OKTA_PASS="${4}";5�_�                       5    ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �               �    docker run --rm -it -v "${HOME}/.aws:/root/.aws" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                       9    ����                                                                                                                                                                                                                                                                                                                                                             _�E�    �               �    docker run --rm -it -v "${HOME}/.aws:/root/.aws" -v "" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �                  docker run --rm -it -v "${HOME}/.aws:/root/.aws" -v "${HOME}/.okta-aws-login/config.properties:/config.properties" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �                      --rm -it -v "${HOME}/.aws:/root/.aws" -v "${HOME}/.okta-aws-login/config.properties:/config.properties" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �      !   !           -it -v "${HOME}/.aws:/root/.aws" -v "${HOME}/.okta-aws-login/config.properties:/config.properties" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                        #    ����                                                                                                                                                                                                                                                                                                                                                             _�E�     �      "   "           -v "${HOME}/.aws:/root/.aws" -v "${HOME}/.okta-aws-login/config.properties:/config.properties" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                    !   H    ����                                                                                                                                                                                                                                                                                                                                                             _�F     �       #   #      �      -v "${HOME}/.okta-aws-login/config.properties:/config.properties" registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                    "   9    ����                                                                                                                                                                                                                                                                                                                                                             _�F     �   !   $   $      �      registry.zeta.tools/security/okta-aws-login:latest --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                    #       ����                                                                                                                                                                                                                                                                                                                                                             _�F     �   "   %   %      y      --profile "${PROFILE}" --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                    $        ����                                                                                                                                                                                                                                                                                                                                                             _�F     �   #   &   &      b      --username "${OKTA_USER}" --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                    %        ����                                                                                                                                                                                                                                                                                                                                                             _�F     �   $   '   '      H      --password "${OKTA_PASS}" --2fa-type google --2fa-token "${TOKEN}"5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             _�F    �   %   (   (      .      --2fa-type google --2fa-token "${TOKEN}"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             _�F8     �         *          �         )    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       _�FG    �                    if [[ -z "${ROLE}" ]]; then       fi5�_�                    #       ����                                                                                                                                                                                                                                                                                                                                                V       _�F�    �   #   %   *            �   #   %   )    5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                                V       _�S     �   #   $                --role "${ROLE}" \5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       _�S    �                    ROLE="${3}";5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       _�S     �         (          OKTA_USER="${4}";5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       _�S   
 �      	   (          OKTA_PASS="${5}";5��