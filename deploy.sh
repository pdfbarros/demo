#!/bin/sh

PORT=5060
IMAGE="demo:1.0.0"

sed "s/__IMAGE__/$IMAGE/g;s/__PORT__/$PORT/g" demo.yaml | kubectl apply -f -
kubectl patch cm tcp-services -ningress-nginx --patch="{\"data\":{\"${PORT}\":\"demo/demo-service:${PORT}\"}}"
