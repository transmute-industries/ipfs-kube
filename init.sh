#! /bin/bash

set -e

go get github.com/Kubuxu/go-ipfs-swarm-key-gen/ipfs-swarm-key-gen
ipfs-swarm-key-gen > swarm.key
echo "./swarm.key created"

kubectl apply -f ./ipfs/ipfs-namespace.yml

kubectl -n ipfs create secret generic swarm-key --from-file=./swarm.key
echo "swarm-key secret created"

kubectl apply -f ./ipfs/ipfs-config.yml

kubectl apply -f ./ipfs/ipfs-service.yml

kubectl apply -f ./ipfs/swarm-service.yml

kubectl apply -f ./ipfs/api-service.yml

kubectl apply -f ./ipfs/readonly-service.yml

kubectl apply -f ./ipfs/ipfs.yml
