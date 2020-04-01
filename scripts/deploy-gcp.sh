echo "Hello traviss" 

GW_BIN="wso2am-micro-gw-toolkit-linux-3.1.0"
#GW_BIN="wso2am-micro-gw-toolkit-3.0.1"

echo "Downloading micro-gw"
wget -q "https://github.com/wso2/product-microgateway/releases/download/v3.1.0/${GW_BIN}.zip"

unzip -q "${GW_BIN}.zip"

MGW_BASE_PATH="$PWD/$GW_BIN"
MGW_BIN="$PWD/$GW_BIN/bin"

echo "${MGW_BIN}"

#cat deployment.toml

#Update deployment.toml
#cd ..

sed -i "s#TOOLKIT_BASE#$MGW_BASE_PATH#g" deployment.toml
ls -ltr myapi
#cat deployment.toml
$MGW_BIN/micro-gw 
$MGW_BIN/micro-gw build myapi #--deployment-config deployment.toml

ls -ltr myapi/target

docker image ls

