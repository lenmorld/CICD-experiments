# Git repo
git@github.com:lenmorld/CICD-experiments.git

### Start Jenkins, if not running yet
brew services start jenkins-lts

#### To check if running
brew services

### Access Jenkins from http://localhost:8080/

lenmorld
m*****2***

#### If credentials not setup yet, see doc

### Open Job "node-docker"
http://localhost:8080/job/node-docker/


### Configure webhook
https://github.com/lenmorld/CICD-experiments/settings/hooks

#### Local tunnel using localhost.run
ssh -R 80:localhost:8080 localhost.run

Use tunnel URL as payload URL
Content-type: application/json
leave defaults