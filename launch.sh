
sudo docker run --gpus "all" --shm-size 1g --detach --name jue-dev -v $HOME:/home/user -v /scratch/jue:/data/jue lorrin/common:latest
