echo "Hello traviss" 

GW_BIN="wso2am-micro-gw-toolkit-linux-3.1.0.zip"
#GW_BIN="wso2am-micro-gw-toolkit-3.0.1.zip"

echo "Downloading micro-gw"
wget "https://github.com/wso2/product-microgateway/releases/download/v3.1.0/${GW_BIN}.zip"

unzip "${GW_BIN}.zip"

MGW_BASE_PATH="$PWD/$GW_BIN"
MGW_BIN="$PWD/$GW_BIN/bin"

$MGW_BIN/micro-gw


