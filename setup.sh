#!/usr/bin/env bash

install_terraform() {
  wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_darwin_amd64.zip -O /tmp/terraform_0.11.7_darwin_amd64.zip
  unzip -o /tmp/terraform_0.11.7_darwin_amd64.zip
  mv terraform /usr/local/bin
}

which terraform >/dev/null || install_terraform

which terraform-docs >/dev/null || brew install terraform-docs
which pre-commit >/dev/null || brew install pre-commit
[ -f .git/hooks/pre-commit ] || pre-commit install