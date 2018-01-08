Get Started
===========

Use Minikube host
-----------------
```
eval $(minikube docker-env)
```

Build and deploy docker image to k8s
------------------------------------
```
docker build -t server:v1 .
kubectl run server --image=server:v1 --port=8000
```

Verify pod is running
---------------------
```
kubectl get deployments
kubectl get pods
```

Cleanup
-------
```
kubectl delete deployment server
eval $(minikube docker-env -u)
```