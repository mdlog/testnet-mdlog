#!/bin/bash

ADDRESS="$WALLET_ADDRESS"
ID="$ID_CHAT"
TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"
while true
do
cd $HOME/massa/massa-client
active_rolls=$(./massa-client wallet_info | grep "Active rolls" | awk '{ print $1 }')
int_rolls=${active_rolls}

# update

# final_balance=$(./massa-client wallet_info | grep "Final balance" | awk '{ print $2 }')
# int_final_balance=${final_balance}
# candidate_balance=$(./massa-client wallet_info | grep "Candidate balance" | awk '{ print $3 }')
# int_candidate_balance=${candidate_balance}
# locked_balance=$(./massa-client wallet_info | grep "Locked balance" | awk '{ print $4 }')
# int_locked_balance=${locked_balance}
# final_rolls=$(./massa-client wallet_info | grep "Final rolls" | awk '{ print $5 }')
# int_final_rolls=${final_rolls}
# candidate_rolls=$(./massa-client wallet_info | grep "Candidate rolls" | awk '{ print $6 }')
# int_candidate_rolls=${candidate_rolls}

if  [ $int_rolls -gt "0" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ✅ NODE: $ADDRESS Aktif"
        # curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ✅ NODE: $ADDRESS Aktif \n Final balance: $int_final_balance \n Candidate balance: $int_candidate_balance \n Locked balance: $int_locked_balance \n Active rolls: $int_rolls \n Final rolls: $int_final_rolls \n Candidate rolls: $int_candidate_rolls"

elif [ $int_rolls  -lt "1" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ❌ NODE: $ADDRESS Tidak Aktif"
        # curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ❌ NODE: $ADDRESS Tidak Aktif \n Final balance: $int_final_balance \n Candidate balance: $int_candidate_balance \n Locked balance: $int_locked_balance \n Active rolls: $int_rolls \n Final rolls: $int_final_rolls \n Candidate rolls: $int_candidate_rolls"

fi
   printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
