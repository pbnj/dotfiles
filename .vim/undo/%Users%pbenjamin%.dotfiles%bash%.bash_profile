Vim�UnDo� ��F��,�Z{��d�I�y�wF���	��   S                                  `4    _�                     m   3    ����                                                                                                                                                                                                                                                                                                                                                             `$�     �   l   n   s      @[ -f "${HOME}/.bash_aliases" ] && source "${HOME}/.bash_aliases"5�_�                    m       ����                                                                                                                                                                                                                                                                                                                                                             `$�    �   l   n   s      ;[ -f "${HOME}/.bash_aliases" ] && source "${HOME}/.aliases"5�_�                    s        ����                                                                                                                                                                                                                                                                                                                                                             `$Ѵ    �   r   s          source "$HOME/.cargo/env"5�_�                    h   #    ����                                                                                                                                                                                                                                                                                                                            i   0       h   #       V   0    `*�f     �   g   h          ## https://github.com/pbnj/giphy-cli   \[ -f "${HOME}/Projects/giphy-cli/giphy.sh" ] && source "${HOME}/Projects/giphy-cli/giphy.sh"5�_�                    g        ����                                                                                                                                                                                                                                                                                                                            h   0       h   #       V   0    `*�g     �   f   g          ## GIPHY CLI5�_�                    g        ����                                                                                                                                                                                                                                                                                                                            g   0       g   #       V   0    `*�g    �   f   g           5�_�                    `        ����                                                                                                                                                                                                                                                                                                                            `          f           V        `*̛    �   _   `          ## Git   # brew install glab   Ecommand -v glab &>/dev/null && source <(glab completion --shell bash)       # brew install gh   Acommand -v gh &>/dev/null && source <(gh completion --shell bash)    5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             `*�     �             
   ## SSH   "SSH_ENV="${HOME}/.ssh/environment"   function start_agent() {   ,        echo "Initialising new SSH agent..."   ?        /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"           echo succeeded           chmod 600 "${SSH_ENV}"   !        . "${SSH_ENV}" >/dev/null           /usr/bin/ssh-add   }5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             `*�     �                 5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             `*�     �             	   $# Source SSH settings, if applicable   if [ -f "${SSH_ENV}" ]; then   !        . "${SSH_ENV}" >/dev/null   O        ps -ef | grep "${SSH_AGENT_PID}" | grep -E "ssh-agent$" >/dev/null || {                   start_agent   	        }   else           start_agent   fi5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             `*�    �                 5�_�                    8        ����                                                                                                                                                                                                                                                                                                                                                             `*�   	 �   <   >          fi�   ;   =          @        [ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"�   :   <          %        export NVM_DIR="${HOME}/.nvm"�   9   ;          if [ -d "${HOME}/.nvm" ]; then�   8   :          Q# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash�   7   9          ## NODE5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `4    �         S       �         R    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `4I    �                shopt -s direxpand5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             `4    �         S       �         R    5��