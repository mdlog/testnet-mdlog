##!/bin/bash

#clear
#SHOW=$(tail -f /root/massa/massa-node/logs.txt)
#TOKEN=5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM
#CHAT_ID=485873863
#MESSAGE=”$SHOW”

#URL=https://api.telegram.org/bot$TOKEN/sendMessage
#curl -s -X POST $URL –d chat_id -d text=”$MESSAGE”


#eof


#!/usr/bin/env bash
# Bot telegram
TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"
CHAT_ID="485873863"
 
PESAN="Halo dikirim dari server <b>$(tail -f /root/massa/massa-node/logs.txt)</b>"
curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$CHAT_ID" -d "parse_mode=html" -d "text=$PESAN"
