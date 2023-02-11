#!/bin/bash

if [[ "$HOSTNAME" =~ "gitops-oci-0" ]]; then
    curl -sfL https://get.k3s.io | K3S_TOKEN=${token} sh -s - server --cluster-init

else
    curl -sfL https://get.k3s.io | K3S_TOKEN=${token} sh -s - server --server https://gitops-oci-0:6443
