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

echo -e "\e[1m\e[32m1. Update dan Instalasi Docker & Docker-Compose... \e[0m" && sleep 1

# update
sudo apt-get update
sudo apt-get install -y cargo
sudo apt-get install screen
sudo apt-get install -y pkg-config
sudo apt-get install cron
sudo apt-get install libsqlite3-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libpq-dev
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo -e "\e[1m\e[32m2. Clone repo Bundlr dan buat wallet Arweave... \e[0m" && sleep 1
git clone --recurse-submodules https://github.com/Bundlr-Network/validator-rust.git
cd validator-rust && RUSTFLAGS="$RUSTFLAGS -A dead_code" cargo run --bin wallet-tool create > wallet.json
