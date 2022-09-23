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
```

curl http://192.168.49.2:4000


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