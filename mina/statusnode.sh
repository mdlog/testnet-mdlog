#!/bin/bash
ADDRESS="B62qj5Mv8tyQ7BSmAEeoHcTR1dwYpwxVy2GXSoajgSfyM3uUDUAiR6R"
ID="485873863"
TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"


while true
do
clear
cd ~
global_block=$(cd && mina client status | grep "Global number of Accounts" | awk '{ print $5 }')
block_node=${global_block}
block=$(cd && mina client status | grep "Block height" | awk '{ print $3 }')
block_height=${block}
AKTIF=" ✅ NODE: $ADDRESS Aktif "\==" Global number of Accounts: $block_node "\==" Block height: $block_height "
# AKTIF=" ✅ NODE: $ADDRESS Aktif "\==" Final balance: $int_final_balance "\==" Candidate balance: $int_candidate_balance "\==" Locked balance: $int_locked_balance "\==" Active rolls: $int_rolls "\==" Final rolls: $int_final_rolls "\==" Candidate rolls: $int_candidate_rolls"
TIDAK=" ❌ NODE: $ADDRESS Aktif "\==" Global number of Accounts: $block_node "\==" Block height: $block_height "
# TIDAK=" ❌ NODE: $ADDRESS Tidak Aktif "\==" Final balance: $int_final_balance "\==" Candidate balance: $int_candidate_balance "\==" Locked balance: $int_locked_balance "\==" Active rolls: $int_rolls "\==" Final rolls: $int_final_rolls "\==" Candidate rolls: $int_candidate_rolls"
 if  [ $block_node -gt "0" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text=$AKTIF"
 elif [ $block_heigth  -lt "1" ]; then
      curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text=$TIDAK"
 fi
   printf "sleep"
       for((sec=0; sec<3; sec++))
       do
              printf "."
               sleep 1
     done
       printf "\n"
done
