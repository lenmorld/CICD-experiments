# CICD experiments


Build
```
docker build -t lenmorld/node_app:latest .
```

Run
```
docker run -d \
	 -p4000:4000 \
	 --name node_app \
	 lenmorld/node_app:latest
```