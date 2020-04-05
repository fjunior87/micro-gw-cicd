#!/bin/bash

GW_BIN="wso2am-micro-gw-toolkit-linux-3.1.0"
#GW_BIN="wso2am-micro-gw-toolkit-3.0.1"
ls -ltr $HOME
if [[  ! -f "$HOME/$GW_BIN/bin/micro-gw" ]]
then
    echo "Downloading micro-gw"
    wget -q "https://github.com/wso2/product-microgateway/releases/download/v3.1.0/${GW_BIN}.zip"
    echo "Unziping MGW Toolkit"
    unzip -q "${GW_BIN}.zip"
fi


MGW_BASE_PATH="$PWD/$GW_BIN"
MGW_BIN="$PWD/$GW_BIN/bin"

echo "${MGW_BIN}"

$MGW_BIN/micro-gw build myapi --docker-image "$DOCKER_USERNAME/myapi-mgw:latest" --docker-base-image wso2/wso2micro-gw:3.1.0

docker push $DOCKER_USERNAME/myapi-mgw:latest
docker tag "$DOCKER_USERNAME/myapi-mgw:latest" "$DOCKER_USERNAME/myapi-mgw:$SHA"
docker push $DOCKER_USERNAME/myapi-mgw:$SHA

sed -i "s/SDOCKER_USERNAME/${DOCKER_USERNAME}/g" kubernetes/myapi-deployment.yaml

# Apply Kubernetes configs
#kubectl delete -f kubernetes/
kubectl apply -f kubernetes/
kubectl set image deployment/myapi-deployment myapi-microgateway="$DOCKER_USERNAME/myapi-mgw:$SHA"

