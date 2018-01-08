#! /bin/bash

set -ex

go get github.com/Kubuxu/go-ipfs-swarm-key-gen/ipfs-swarm-key-gen
ipfs-swarm-key-gen > swarm.key
echo "./swarm.key created"

kubectl apply -f ./ipfs-namespace.yml
echo "namespace \"ipfs\" configured"

kubectl -n ipfs create secret generic swarm-key --from-file=./swarm.key
echo "swarm-key secret created"

kubectl apply -f ./ipfs-config.yml
echo "configmap \"ipfs-config\" created"

kubectl apply -f ./ipfs-service.yml
echo "service \"ipfs\" created"

kubectl apply -f ./swarm-service.yml
echo "service \"swarm\" created"

kubectl apply -f ./api-service.yml
echo "service \"api\" created"

kubectl apply -f ./readonly-service.yml
echo "service \"readonly\" created"

kubectl apply -f ./ipfs.yml
echo "statefulset \"ipfs\" created"
