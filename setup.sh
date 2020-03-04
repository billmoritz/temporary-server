#!/usr/bin/env bash

install_terraform() {
  if [ $(command -v tfswitch) ]; then
    tfswitch <.tfswitchrc
  elif [ $(command -v tfenv) ]; then
    tfenv install min-required && tfenv use min-required
  else
    wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_darwin_amd64.zip -O /tmp/terraform_0.12.21_darwin_amd64.zip
    unzip -o /tmp/terraform_0.12.21_darwin_amd64.zip
    mv terraform /usr/local/bin
  fi
}

command -v terraform >/dev/null || install_terraform

command -v terraform-docs >/dev/null || brew install terraform-docs
command -v pre-commit >/dev/null || brew install pre-commit
[ -f .git/hooks/pre-commit ] || pre-commit install
