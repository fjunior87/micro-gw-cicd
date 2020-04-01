echo "Hello traviss" 

GW_BIN="wso2am-micro-gw-toolkit-linux-3.1.0"
#GW_BIN="wso2am-micro-gw-toolkit-3.0.1"

echo "Downloading micro-gw"
wget -q "https://github.com/wso2/product-microgateway/releases/download/v3.1.0/${GW_BIN}.zip"

unzip -q "${GW_BIN}.zip"

MGW_BASE_PATH="$PWD/$GW_BIN"
MGW_BIN="$PWD/$GW_BIN/bin"

echo "${MGW_BIN}"

$MGW_BIN/micro-gw build myapi --docker-image fjunior87/myapi-mgw:v1 --docker-base-image wso2/wso2micro-gw:3.1.0

docker image ls

docker push fjunior87/myapi-mgw:v1

# Apply Kubernetes configs
kubectl apply -f kubernetes/

