[![terraform-cluster-oci](https://github.com/sredevopsdev/gitops-oci/actions/workflows/terraform-cicdv2.yaml/badge.svg)](https://github.com/sredevopsdev/gitops-oci/actions/workflows/terraform-cicdv2.yaml)

# Work in progress! 🚧

## Testers, reviewers, enthusiasths wanted.

## What's working:

Terraform
- OCI Infrastructure, always free resources.
- Github Workflow and automation for CI with Terraform.
- Very poor management of the state through artifacts

## What's pending:

- k3s deployment automation
- k3s load balancer or ingress
- flux bootstraping, all resources except base infra and k3s

You'll need an [Oracle CLoud Account - Always Free Tier](https://www.oracle.com/cl/cloud/free/)

## Requirements (local execution)


The following tools must be installed., and available in the path for this project to work properly:

<details>
<summary>Terraform</summary>

### macOS

```bash
    brew install terraform
```

### Linux

```bash
    
wget <https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip>
unzip terraform_0.12.24_linux_amd64.zip
sudo mv terraform /usr/local/bin/

```
</details>

<details>
<summary>direnv</summary>

### macOS

```bash
    brew install direnv

```

### Linux

```bash
    sudo apt-get install direnv
```
</details>

<details>
<summary>kubectl</summary>

### macOS

```bash
brew install kubectl
```

### Linux

```bash
curl -LO "https://dl.k8s.io/release/stable.txt"
VERSION=$(cat stable.txt)
curl -LO <https://dl.k8s.io/${VERSION}/bin/linux/amd64/kubectl>
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```
</details>

<details>
<summary>Helm</summary>

### macOS

```bash
    brew install helm
```

### Linux

```bash
    wget <https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz>
    tar -zxvf helm-v3.2.4-linux-amd64.tar.gz
    sudo mv linux-amd64/helm /usr/local/bin/
```
</details>

# Environment variables (.envrc.sample)

```bash
export TF_VAR_compartment_id=""
export TF_VAR_user_ocid=""
export TF_VAR_fingerprint=""
export TF_VAR_private_key=""
export TF_VAR_ssh_authorized_keys=""
export TF_VAR_ssh_public_key=""
export TF_VAR_image_ocid=""
export TF_VAR_cluster_token=""
export TF_VAR_region=""
export TF_VAR_private_key_path=""
export TF_VAR_tenancy_ocid=""
export TF_VAR_compartment_ocid=""
export TF_VAR_current_user_ocid=""
export TF_VAR_region=""
export TF_VAR_tenancy_ocid=""
export TF_VAR_ssh_private_key_path=""
export TF_VAR_ssh_private_key=""
```


# Visual Studio Code Configuration

To make sure all the required tools are correctly configured in Visual Studio Code, the following extensions should be installed:

- [Terraform](https://marketplace.visualstudio.com/items?itemName=mauve.terraform)
- [Kubernetes](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
- [Helm](https://marketplace.visualstudio.com/items?itemName=tjl.vscode-helm)

Additionally, the following settings in Visual Studio Code should be configured:

```json
    {
      "terraform.path": "/usr/local/bin/terraform",
      "kubectl.path": "/usr/local/bin/kubectl",
      "helm.path": "/usr/local/bin/helm",
      "direnv.enable": true
      }

```


# Review the .envrc.example file!
