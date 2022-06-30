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

clear
cd $HOME
wget -O mdbotedit.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/bot/mdbotedit.sh && chmod +x mdbotedit.sh && nohup ./mdbotedit.sh
# wget -O mdbot.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/bot/mdbot.sh && chmod +x mdbot.sh && nohup ./mdbot.sh

