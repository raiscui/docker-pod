docker-pod
==========

a pod image for docker

INFO
===
OS:ubuntu 14 latest
apt-fast
apt-metalink
git
vim
node
pod for node
pm2 in pod

USE
===
first
mkdir /home/rais/docker-data/gabriel/nodeapp/apps
mkdir /home/rais/docker-data/gabriel/nodeapp/repos
mkdir /home/rais/docker-data/gabriel/pm2log
mkdir /docker-data
ln -s /home/rais/docker-data /docker-data


xxxx:80 the xxxx port is you node app want port
BUILD:
docker build -t raiscui/pod:latest .
RUN:
docker run -d --name you_CONTAINER_name -p 9022:22 -p 80:80 -p 19999:19999 -e ROOT_PASS="rootpass" -v /docker-data/gabriel/nodeapp:/nodeapp -v /docker-data/gabriel/pm2log:/.pm2 raiscui/pod
RUN -i -t:
docker run -i -t raiscui/pod /bin/bash