# NOT NO BE USED YET

[![tfsec](https://github.com/sredevopsdev/gitops-oci/actions/workflows/tfsec.yml/badge.svg)](https://github.com/sredevopsdev/gitops-oci/actions/workflows/tfsec.yml)

## Requirements

The following tools must be installed and available in the path for this project to work properly. Note: direnv is meant to be used only in local environment.

## Terraform

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

## direnv

### macOS

```bash
    brew install direnv

```

### Linux

```bash
    sudo apt-get install direnv
```

## kubectl

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

## Helm

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
