#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y git mc apt-transport-https python-pip ipset
pip install paramiko pyyaml
curl -sfL https://get.k3s.io | sh -

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

kubectl wait --for=condition=Ready node/transport-0

cp /etc/rancher/k3s/k3s.yaml /root/.kube/config

VERSION=0.3.1
helm -n fleet-system install --create-namespace --wait \
    fleet-crd https://github.com/rancher/fleet/releases/download/v${VERSION}/fleet-crd-${VERSION}.tgz
helm -n fleet-system install --create-namespace --wait \
    fleet https://github.com/rancher/fleet/releases/download/v${VERSION}/fleet-${VERSION}.tgz
