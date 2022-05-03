#!/bin/sh 
DEBUG=${DEBUG:=0}
IMAGE=${IMAGE:=demo:1.0.0}
FORCE=$1

[ ${DEBUG} -eq 1 ] && set -x

iname=${IMAGE%:*}
itag=${IMAGE#*:}
if [ -z "$(docker images | grep "$iname" | grep "$itag")" ] || [ "$FORCE" == "force" ]; then
    docker build -t $IMAGE .
fi

minikube status
if [ "$?" != '0' ]; then	
    minikube start --nodes 2
    minikube addons enable ingress
    kubectl create ns demo
fi

minikube image load "$IMAGE"