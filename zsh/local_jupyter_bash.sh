#!/bin/bash
echo "Running docker run jupyter /bin/bash"

image_name='drgois/jupyter:upgraded'

container_name='local_jupyter'

is_running=$(docker ps -a | grep local_jupyter | wc -l)

if [ "$is_running" -gt "0" ]; then
    docker rm "$container_name"
    #docker kill "$container_name"
fi

sleep 2.5

docker run -it --name $container_name -p 9888:8888 -p 9080:8080 -v /media/zetdg/DATADRIVE2/:/home/jovyan $image_name /bin/bash

read -p 'Do you want to commit?: ' commit_flag

if [ "$commit_flag" == "y" ]; then
    read -p 'Commit message, please?: ' commit_msg

    if [ -z "$commit_msg" ]; then
        commit_msg='None specified';
    fi

    docker commit -m '$commit_msg' $container_name $image_name || echo 'Commit failed'
fi

is_running=$(docker ps -a | grep local_jupyter | wc -l)

if [ $is_running -gt 0 ]; then
    docker rm "$container_name"
fi

echo 'Done'

sleep 5.5