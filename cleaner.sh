#/bin/bash
#remove all running containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)