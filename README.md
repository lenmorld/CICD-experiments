# Git repo

### Jenkins CI:
git@github.com:lenmorld/CICD-experiments.git

### Argo CD:
https://github.com/lenmorld/argocd.git

# Setup

### Open Docker runtime

Docker must be running when starting minikube

### Local minikube
```
minikube start
minikube status
```

if needed to cleanup, e.g. to start from scratch
```
minikube delete
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
```
kubectl delete namespace argocd
```

### apply yaml file that installs everything ArgoCD needs 

install to ArgoCD namespace
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Get all pods on Argo namespace
```
kubectl get pod -n argocd
```

Re-run (wait) until all the pods are Running

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


# login to Argo via CLI

argocd login localhost:8081

~/telebit http 8081

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

### apply declarative setup
Do this where the manifests are, i.e. in the Argo CD repo (not the app repo where Jenkinsfile is)
```
kubectl apply -f application.yaml
```

### Configure webhook
https://github.com/lenmorld/argocd/settings/hooks

### Open a ngrok tunnel
ngrok http https://127.0.0.1:8081

Use tunnel URL as payload URL
Content-type: application/json
leave defaults††

### To verify/manage tunnel
Login to ngrok
https://dashboard.ngrok.com/tunnels/agents


# Access app once it's deployed

### get status and IP

```bash
# NodePort e.g. 30201 should show here
docker port minikube

# NodePort should be here
kubectl get svc

# 
minikube ip
```

### browser
go to http://localhost:30201

### ssh

```
minikube ssh

$ curl <minikube-ip>:<nodeport>

# e.g.
$ curl http://192.168.49.2:30100
```