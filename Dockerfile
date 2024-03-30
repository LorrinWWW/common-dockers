FROM nvcr.io/nvidia/pytorch:24.03-py3 as base

ENV HOST docker
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes
ENV TZ America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# git for installing dependencies
# tzdata to set time zone
# wget and unzip to download data
# [2021-09-09] TD: zsh, stow, subversion, fasd are for setting up my personal environment.
# [2021-12-07] TD: openmpi-bin for MPI (multi-node training)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    sudo \
    htop \
    git \
    tzdata \
    wget \
    tmux \
    zip \
    unzip \
    zsh stow subversion fasd

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN mkdir -p /home/user && chmod 777 /home/user
WORKDIR /home/user

RUN pip install ninja
RUN pip install flash-attn
