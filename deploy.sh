#!/bin/sh

PORT=5061
IMAGE="demo:2.0.0"

sed "s/__IMAGE__/$IMAGE/g;s/__PORT__/$PORT/g" demo.yaml | kubectl apply -f -
kubectl patch cm udp-services -ningress-nginx --patch="{\"data\":{\"${PORT}\":\"demo/demo-service:${PORT}\"}}"
kubectl patch deployment ingress-nginx-controller --patch "$(cat ingress-nginx-patch.yaml | sed 's/__PORT__/${PORT}/g')" -ningress-nginx

#grep "demo.net" /etc/hosts || sudo -- sh -c "echo -e '$(minikube ip | awk 'NR==1')\tdemo.net' >> /etc/hosts";
echo "run: telnet $(minikube ip) ${PORT}"
#telnet $(minikube ip) ${PORT}
