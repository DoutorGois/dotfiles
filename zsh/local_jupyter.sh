#!/bin/bash
echo "Running docker run jupyter notebook"
image_name='drgois/jupyter:upgraded'

container_name='local_jupyter'

is_running=$(docker ps -a | grep local_jupyter | wc -l)

if [ "$is_running" -gt "0" ]; then
    docker rm -f "$container_name"
    #docker kill "$container_name"
fi

sleep 2.5

google-chrome "http://localhost:9888" &

docker run -it --name $container_name -p 9888:8888 -p 9080:8080 -v /media/zetdg/DATADRIVE2/:/home/jovyan $image_name jupyter notebook

read -p 'Do you want to commit?: ' commit_flag

#if [ "$commit_flag" == "y" ]; then
if [ -n "$commit_flag" ]; then
    read -p 'Commit message, please?: ' commit_msg

    if [ -z "$commit_msg" ]; then
        commit_msg='None specified';
    fi

    echo 'Commiting'

    docker commit -m '$commit_msg' $container_name $image_name || echo 'Commit failed'

    pid_commit=$!
    echo ', wait...'
    #wait $pid_commit
    echo ' done!'
fi

is_running=$(docker ps -a | grep local_jupyter | wc -l)

if [ $is_running -gt 0 ]; then
    docker rm -f "$container_name"
fi

echo 'Done'

sleep 6000



