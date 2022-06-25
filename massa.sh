#!/bin/bash
echo "================================================================================"
echo -e "\033[0;35m"
echo " :::       :::   :::::::::       :::            :::::::::       ::::::::::    ";
echo " ::: +   + :::   :::     ::::    :::           ::::    :::     ::::     :::   ";
echo " :+: ++ ++ :+:   :+:     :+::+   ::+           +::      ::+    :+:            ";
echo " +:+  +:+  +:+   ++:      ++:+   +:+          :++       ++:    +:+#####++:   ";
echo " +#+       +#+   +++      #+++   #++          +#+       +#+    +#+     #++#   ";
echo " ###       ###   ###    #####    #########     ###     ###     ###      ###   ";
echo " ###       ###   ### ######      #########       #######        ##########    ";
echo -e "\e[0m"
echo "================================================================================="

echo -e "\e[1m\e[32m1. Delete Folder Massa dan massa.sh... \e[0m" && sleep 1
#delete
rm -rf massa
rm -rf massa.sh

echo -e "\e[1m\e[32m2. Updating packages... \e[0m" && sleep 1
# update
sudo apt update 

echo -e "\e[1m\e[32m3. Installing dependencies... \e[0m" && sleep 1
# packages
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev
sudo apt-get install librocksdb-dev build-essential
sudo apt install screen

# install rustup
cd $HOME
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup toolchain install nightly
rustup default nightly

echo -e "\e[1m\e[32m4. Downloading and building... \e[0m" && sleep 1
# download binary
cd $HOME
git clone --branch testnet https://github.com/massalabs/massa.git
cd massa/massa-node
RUST_BACKTRACE=full cargo run --release |& tee logs.txt
