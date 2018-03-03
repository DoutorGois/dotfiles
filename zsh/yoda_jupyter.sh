#!/bin/bash
echo "Running docker run jupyter notebook"
#image_name='drgois/jupyter:upgraded'
image_name='jupyter/datascience-notebook'
container_name='local_jupyter'

is_running=$(docker ps -a | grep local_jupyter | wc -l)

if [ "$is_running" -gt "0" ]; then
    docker rm -f "$container_name"
    #docker kill "$container_name"
fi

sleep 2.5

docker run -it --name $container_name -p 8443:8888 -v /home/zetdg/data:/home/jovyan/data -v /home/zetdg/notebook:/home/jovyan/notebook -v /mnt/nfs/dados_nas/proc:/home/jovyan/proc -v /mnt/nfs/dados_nas/raw:/home/jovyan/raw -v /mnt/nfs/dadosnas/digest:/home/jovyan/digest -v /mnt/nfs/dados_nas/report:/home/jovyan/report -e NB_UID=1000 -e NB_GID=100 -e GRAND_SUDO=yes $image_name start-notebook.sh --NotebookApp.token=''

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



