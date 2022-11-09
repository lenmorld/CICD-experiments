# Setup

### Open Docker runtime

Docker must be running when starting minikube

### Local minikube
```
minikube start
minikube status
```

#### to open up a NodePort locally
```
minikube start --ports=30201:30201
```

### Create Argo namespace
```
kubectl create namespace argocd
```

if needed to cleanup, e.g. to start from scratch

### apply yaml file that installs everything ArgoCD needs 

install to ArgoCD namespace
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Get all pods on Argo namespace
```
kubectl get pod -n argocd
```

Wait until all the pods are ready/running

### Make ArgoCD server available locally
using port-forwarding
```
kubectl port-forward svc/argocd-server -n argocd 8081:443 
``` 

### Now you can access on https://127.0.0.1:8081/
https://127.0.0.1:8081/

### To login
username: `admin`

Get password from secret
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

# Manual creation of app (skip if using declarative)
```
argocd app create app-ui --repo https://github.com/lenmorld/CICD-experiments.git --path kubernetes --dest-server https://kubernetes.default.svc --dest-namespace default
```

```
argocd app get app-ui
```

```
argocd app sync app-ui

# sync every 3 minutes
argocd app set <APPNAME> --sync-policy automated
```

curl http://192.168.49.2:4000


# Creating app using Declarative
```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-ui
spec:
  selector:
    app: app-ui
  ports:
  - port: 4000
    targetPort: 4000
```

argocd login localhost:8081

~/telebit http 8081


### apply declarative setup
Do this where the manifests are, i.e. in the Argo CD repo (not the app repo where Jenkinsfile is)
```
kubectl apply -f application.yaml
```

# Local tunnel using localhost.run
ssh -R 80:localhost:8080 localhost.run
