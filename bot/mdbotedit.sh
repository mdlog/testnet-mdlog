#!/bin/bash

ADDRESS="$WALLET_ADDRESS"
ID="$ID_CHAT"
TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"
PASSWORDKU=$PASSWORD
while true
do
cd $HOME/massa/massa-client
active_rolls=$(./massa-client wallet_info -p $PASSWORDKU | grep "Active rolls" | awk '{ print $3 }')
int_rolls=${active_rolls}

# update

final_balance=$(./massa-client wallet_info -p $PASSWORDKU | grep "Final balance" | awk '{ print $3 }')
int_final_balance=${final_balance}
candidate_balance=$(./massa-client wallet_info -p $PASSWORDKU | grep "Candidate balance" | awk '{ print $3 }')
int_candidate_balance=${candidate_balance}
locked_balance=$(./massa-client wallet_info -p $PASSWORDKU | grep "Locked balance" | awk '{ print $3 }')
int_locked_balance=${locked_balance}
final_rolls=$(./massa-client wallet_info -p $PASSWORDKU | grep "Final rolls" | awk '{ print $3 }')
int_final_rolls=${final_rolls}
candidate_rolls=$(./massa-client wallet_info -p $PASSWORDKU | grep "Candidate rolls" | awk '{ print $3 }')
int_candidate_rolls=${candidate_rolls}
AKTIF=" ✅ NODE: $ADDRESS Aktif "\==" Final balance: $int_final_balance "\==" Candidate balance: $int_candidate_balance "\==" Locked balance: $int_locked_balance "\==" Active rolls: $int_rolls "\==" Final rolls: $int_final_rolls "\==" Candidate rolls: $int_candidate_rolls"
TIDAK=" ❌ NODE: $ADDRESS Tidak Aktif "\==" Final balance: $int_final_balance "\==" Candidate balance: $int_candidate_balance "\==" Locked balance: $int_locked_balance "\==" Active rolls: $int_rolls "\==" Final rolls: $int_final_rolls "\==" Candidate rolls: $int_candidate_rolls"
if  [ $int_rolls -gt "0" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text=$AKTIF"
elif [ $int_rolls  -lt "1" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text=$TIDAK"
fi
   printf "sleep"
        for((sec=0; sec<1800; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
