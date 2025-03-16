chmod 700 get_helm.sh

./get_helm.sh
helm repo add harness-delegate https://app.harness.io/storage/harness-download/delegate-helm-chart/
helm repo update harness-delegate
# sudo rm -f /usr/share/keyrings/cloud.google.gpg
# sudo rm -f /etc/apt/sources.list.d/google-cloud-sdk.list
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
gpg --show-keys /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update && sudo apt install -y google-cloud-cli
gcloud auth login --no-browser
gcloud config set project indigo-computer-316113
gcloud container clusters get-credentials  autopilot-cluster-1 --zone  asia-south1
sudo apt install -y google-cloud-sdk-gke-gcloud-auth-plugin
helm upgrade -i helm-delegate --namespace harness-delegate-ng --create-namespace   harness-delegate/harness-delegate-ng   --set delegateName=helm-delegate   --set accountId=FY69Yl-mTl-pIfuhkb1osQ   --set delegateToken=MjUxMGVmOGRjOGVhMWJiYTJhYWMzN2RiMDNmMDliZTg=   --set managerEndpoint=https://app.harness.io   --set delegateDockerImage=harness/delegate:25.02.85300   --set replicas=1 --set upgrader.enabled=true