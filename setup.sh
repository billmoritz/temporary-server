#!/usr/bin/env bash

wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_darwin_amd64.zip -O /tmp/terraform_0.11.7_darwin_amd64.zip
unzip -o /tmp/terraform_0.11.7_darwin_amd64.zip
mv terraform /usr/local/bin

brew install pre-commit
which pre-commit > /dev/null && pre-commit install