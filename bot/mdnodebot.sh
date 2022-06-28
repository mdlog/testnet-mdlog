#!/bin/bash

clear
SHOW=$(tail /var/log/xferlog)
TOKEN=5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM
CHAT_ID=485873863
MESSAGE=”$SHOW”

URL=https://api.telegram.org/bot$TOKEN/sendMessage
curl -s -X POST $URL –d chat_id -d text=”$MESSAGE”


eof
