#! /bin/bash

set -ex

echo "Creating private swarm key"
go get github.com/Kubuxu/go-ipfs-swarm-key-gen/ipfs-swarm-key-gen
ipfs-swarm-key-gen > swarm.key

echo "Create ipfs namespace"
kubectl apply -f ./ipfs-namespace.yml

echo "Store private swarm key as secret in ipfs namespace"
kubectl -n ipfs create secret generic swarm-key --from-file=./swarm.key

echo "Create configmap ipfs-config"
kubectl apply -f ./ipfs-config.yml

echo "Create ipfs service"
kubectl apply -f ./ipfs-service.yml

echo "Create swarm service"
kubectl apply -f ./swarm-service.yml

echo "Create api service"
kubectl apply -f ./api-service.yml

echo "Create readonly service"
kubectl apply -f ./readonly-service.yml

echo "Create ipfs statefulset"
kubectl apply -f ./ipfs-statefulset.yml
