#!/bin/bash
echo "Running docker run jupyter notebook"
image_name='drgois/jupyter:upgraded'
#image_name='jupyter/datascience-notebook'
container_name='gois_jupyter'

is_running=$(docker ps -a | grep local_jupyter | wc -l)

if [ "$is_running" -gt "0" ]; then
    docker rm -f "$container_name"
    #docker kill "$container_name"
fi
docker rm -f "$container_name"

sleep 2.5

# google-chrome "http://localhost:9888" &

#docker run -it --name $container_name -p 9888:8888 -p 9080:8080 -v /media/zetdg/DATADRIVE2/:/home/jovyan $image_name jupyter notebook

sudo docker run -it -p 8443:8888 -p 9080:8080 --name $container_name -v /home/zetdg/data:/home/jovyan/data -v /home/zetdg/notebook:/home/jovyan/notebook -v /mnt/ntfs/dados_nas/proc:/home/jovyan/proc -v /mnt/nfs/dados_nas/raw:/home/jovyan/raw -v /mnt/nfs/dados_nas/digest:/home/jovyan/digest -v /mnt/nfs/dados_nas/report:/home/jovyan/report -e NB_UID=1002 -e NB_GID=100 -e GRANT_SUDO=yes $image_name jupyter notebook --NotebookApp.token=""

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



