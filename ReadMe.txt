//ReadMe
//run dorun.sh in which will run the two container ng and activity2
./dorun.sh run
//follow the three steps for hotswap:

docker run --network ecs189_default --name web2 vhactivity &

//do the swapping
//1) connection to the network
docker network ls
docker network inspect ecs189_default
docker run --network ecs189_default --name web2 activity2 &

//2)swapping
//swap proxy with swap2.sh
//swap2.sh is swapping from web1 to web2
docker exec ecs189_proxy_1 /bin/bash /bin/swap2.sh

//3)kill and remove the old image
Docker rm -f ecs189_web1_1

//do the other swapping and keep repeating the process
docker run --network ecs189_default --name web1 activity2 &
docker exec ecs189_proxy_1 /bin/bash /bin/swap1.sh
Docker rm -f web2
