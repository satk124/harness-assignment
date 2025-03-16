module "delegate" {
  source = "harness/harness-delegate/kubernetes"
  version = "0.1.8"

  account_id = "FY69Yl-mTl-pIfuhkb1osQ"
  delegate_token = "MjUxMGVmOGRjOGVhMWJiYTJhYWMzN2RiMDNmMDliZTg="
  delegate_name = "terraform-delegate"
  deploy_mode = "KUBERNETES"
  namespace = "harness-delegate-ng"
  manager_endpoint = "https://app.harness.io"
  delegate_image = "harness/delegate:25.02.85300"
  replicas = 1
  upgrader_enabled = true
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}