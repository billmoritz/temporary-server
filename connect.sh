#!/usr/bin/env bash

function backoff {
  local attempts=${ATTEMPTS-5}
  local timeout=${TIMEOUT-1}
  local attempt=0
  local exitCode=0

  while [[ $attempt < $attempts ]]
  do
    "$@"
    exitCode=$?

    [[ $exitCode == 0 ]] && break

    echo "Failed, Retrying in $timeout.." 1>&2
    sleep $timeout
    attempt=$(( attempt + 1 ))
    timeout=$(( timeout * 2 ))
  done

  [[ $exitCode != 0 ]] && echo "Failed" 1>&2

  return $exitCode
}

terraform init
terraform apply -auto-approve
IP=$(terraform output ipv4_address)
SSH_KEY=$(terraform output private_key_file)
ssh -O check $IP
ssh -O stop $IP
backoff ssh -tA -C -D 8140 -i $SSH_KEY root@$IP
ssh -O check $IP
ssh -O stop $IP
terraform destroy -auto-approve
