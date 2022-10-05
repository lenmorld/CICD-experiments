if local
```
minikube start
minikube status
```

```
kubectl create namespace argocd
```

apply yaml file that installs everything ArgoCD needs
instal to ArgoCD namespace
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

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


# TODO:
learn how to make declarative Argo

```
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


ZL7o1guioMb0ISnk

argocd login localhost:8081


~/telebit http 8081


---
kubectl apply -f application.yaml


# TODO:

- try just jenkins, without Argo
- update image in deployment.yaml then do a kubectl apply ...