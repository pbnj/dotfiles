# Kubectl
if type -q kubectl
    abbr -a k 'kubectl'
    abbr -a kd 'kubectl delete'
    abbr -a kdp 'kubectl delete pods'
    abbr -a kdd 'kubectl delete deployments'
    abbr -a kg 'kubectl get'
    abbr -a kgd 'kubectl get deployments'
    abbr -a kgp 'kubectl get pods'
    abbr -a kl 'kubectl logs'
end

function install_kubectl
  echo "# INSTALLING KUBECTL"
  set -l KUBECTL_VERSION (curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)

  echo "## DOWNLOADING KUBECTL $KUBECTL_VERSION"
  if [ (uname) = "Darwin" ]
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/darwin/amd64/kubectl
  end

  if [ (uname) = "Linux" ]
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl
  end

  chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl

  echo "## FINISHED INSTALLING KUBECTL"
end
