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
if [ ! $IP_SERVER ]; then
read -p "Input Your Aleo Wallet Address : " ADDRESS
echo 'export ADDRESS='\"${ADDRESS}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

# Install the latest version of Rust using rustup

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -1

# update and install git clang libssl-dev pkg-config
sudo apt update
sudo apt install git clang libssl-dev pkg-config --no-install-recommends -y

# Clone and build the prover
git clone https://github.com/HarukaMa/aleo-prover -b testnet3-new
cd aleo-prover

# Build the prover using cargo:
cargo build --release

# run Prover
cargo run --release -- -a $ADDRESS -p pool.hamp.app:4444


