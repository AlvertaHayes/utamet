#!/bin/bash -x

scriptDir=$(dirname $0)
currentDir=$(pwd)

. $scriptDir/common-setup.sh

docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) --name custom-execution --network host -v $currentDir/$DATA_DIR:/data $EL_BINARY_DIR --http -http.api "engine,net,eth,miner" --http.port $ETH_PORT --authrpc.port $ENGINE_PORT --authrpc.jwtsecret /data/jwtsecret --allow-insecure-unlock --unlock $pubKey --password /data/password.txt --datadir /data/geth --syncmode full
