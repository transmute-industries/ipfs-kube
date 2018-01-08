Get Started
===========

ipfs-kube works with both a full kubernetes deployment, or the
[minikube](https://kubernetes.io/docs/getting-started-guides/minikube/)
all-in-one system

With Minikube
-------------

`./reset.sh` to set minikube up in a clean state

`./init.sh` to create the related namespace, configmap, services, and statefulset

Running tests
-------------

IP and port depends on your setup and the `type` you chose for services. Example with minikube NodePort and the random ports from `kubectl create -f 3[service].yml`:

```bash
ipfs_api=$(minikube service -n ipfs --url api)
ipfs_ro=$(minikube service -n ipfs --url readonly)
echo '{"test":1}' > test1
curl -F "data=@./test1" $ipfs_api/api/v0/add
# {"Name":"test1","Hash":"QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq"}
curl $ipfs_ro/ipfs/QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq
# {"test":1}
curl $ipfs_api/api/v0/cat?arg=QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq
# {"test":1}
curl $ipfs_api/api/v0/pin/add?arg=QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq
# {"Pins":["QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq"]}
curl $ipfs_api/api/v0/pin/rm?arg=QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq
# {"Pins":["QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq"]}
curl $ipfs_api/api/v0/pin/rm?arg=QmSUFD7V8MfmLYEHWw9phnGEFhrjuYxGTgzEtMJuNoB6Jq
# {"Message":"not pinned","Code":0}
curl $ipfs_api/api/v0/repo/gc
``` 