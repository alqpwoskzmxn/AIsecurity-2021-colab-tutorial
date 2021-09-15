#!/usr/bin/sh

if ! command -v docker &> /dev/null; then echo "docker not found!"; exit; fi

if ! groups ${USER} | grep -oP "docker" &>/dev/null; then echo "docker cannot run on user!"; exit; fi

docker run --rm -it -v $(readlink -f .):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:1.15.5-gpu-py3-jupyter

