#/bin/bash


    docker ps -a  > /tmp/yy_xx$$
    if grep --quiet $1 /tmp/yy_xx$$
     then
        #remove all running containers
        ./cleaner.sh

        #cleanup
        ./cleanup.sh run

        #run the shell the display the two images
        ./dorun.sh run

        sleep 50 && open http://192.168.99.100:8888/index.jsp?user_name=ibrahimalsinafi

        #create an image from vhactivity called "web2" 
        docker run --network ecs189_default --name web2 vhactivity

        docker exec ecs189_proxy_1 /bin/bash /bin/swap2.sh
        docker rm -f ecs189_web1_1

        open http://192.168.99.100:8888/index.jsp?user_name=ibrahimalsinafi

     else
         #run the shell the display the two images
        ./dorun.sh run

        sleep 50 && open http://192.168.99.100:8888/index.jsp?user_name=ibrahimalsinafi

        #create an image from vhactivity called "web2" 
        docker run --network ecs189_default --name web2 vhactivity

        docker exec ecs189_proxy_1 /bin/bash /bin/swap2.sh
        docker rm -f ecs189_web1_1

        open http://192.168.99.100:8888/index.jsp?user_name=ibrahimalsinafi
   fi
