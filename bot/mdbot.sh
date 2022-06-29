
#!/bin/bash

ADDRESS="$WALLET_ADDRESS"
ID="$ID_CHAT"
TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"
while true
do
cd $HOME/massa/massa-client
active_rolls=$(./massa-client wallet_info | grep "Active rolls" | awk '{ print $3 }')
int_rolls=${active_rolls}

if  [ $int_rolls -gt "0" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ✅ NODE: $ADDRESS Aktif"

elif [ $int_rolls  -lt "1" ]; then

        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ❌ NODE: $ADDRESS Tidak Aktif"

fi

   printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
