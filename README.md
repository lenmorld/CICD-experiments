# CICD experiments


Build
```
docker build -t lenmorld/node_app:latest .
```

Run docker image
```
docker run -d \
	 -p4000:4000 \
	 --name node_app \
	 lenmorld/node_app:latest
```

# Dockerhub - see all pushed images from CI

https://hub.docker.com/repository/docker/lenmorld/node_app


# Misc

### need to expose local Jenkins in 8080 for Github webhooks
npx localtunnel --port 8080