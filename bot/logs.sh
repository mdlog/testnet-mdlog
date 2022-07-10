#!/bin/bash

ADDRESS="$WALLET_ADDRESS"
ID="$ID_CHAT"
TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"
PASSWORD="Makassar123"



while true
do

SHOW=$(tail /root/massa/massa-node/logs.txt)
# update
MESSAGE="$SHOW"
curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text=$MESSAGE"

printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done

