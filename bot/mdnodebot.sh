#!/bin/bash
echo "================================================================================"
echo -e "\033[0;35m"
echo " :::       :::   :::::::::       :::           :::::::::      ::::::::::    ";
echo " ::: +   + :::   :::     ::::    :::          ::::    :::    :::       ::   ";
echo " :+: ++ ++ :+:   :+:     :+::+   ::+          +::      ::+   :+:            ";
echo " +:+  +:+  +:+   ++:      ++:+   +:+         :++       ++:   :+:+#######  ";
echo " +#+       +#+   +++      #+++   #++         +#+       +#+   +#+      ###   ";
echo " ###       ###   ###    #####    #########    ###     ###    ###      ###   ";
echo " ###       ###   ### ######      #########      #######       ##########   ";
echo -e "\e[0m"
echo "================================================================================="

sleep 1

# set vars
if [ ! $ID_CHAT ]; then
read -p "Input ID_CHAT Kamu: " ID_CHAT
echo 'export ID_CHAT='\"${ID_CHAT}\" >> $HOME/.bash_profile
read -p "Input Wallet Address Kamu: " WALLET_ADDRESS
echo 'export WALLET_ADDRESS='\"${WALLET_ADDRESS}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "ID Chat Kamu: \e[1m\e[32m${ID_CHAT}\e[0m"
echo -e "Wallet Address Kamu: \e[1m\e[32m${WALLET_ADDRESS}\e[0m"
echo '================================================='
sleep 1

TOKEN_BOT="5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM"
CHAT_ID="485873863"

PESAN="$SHOW"

cd $HOME/massa/massa-client
active_rolls=$(./massa-client wallet_info | grep "Active rolls" | awk '{ print $3 }')
int_rolls=${active_rolls}

if  [ $int_rolls -gt "0" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$CHAT_ID" -d "parse_mode=html" -d "text=NODE AKTIF"

elif [ $int_rolls  -lt "1"]; then

        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$CHAT_ID" -d "parse_mode=html" -d "text=NODE TIDAK AKTIF"


fi

