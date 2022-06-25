#!/bin/bash
echo "================================================================================"
echo -e "\033[0;35m"
echo " :::       :::   :::::::::       :::            :::::::::       ::::::::::    ";
echo " ::: +   + :::   :::     ::::    :::           ::::    :::     ::::     :::   ";
echo " :+: ++ ++ :+:   :+:     :+::+   ::+           +::      ::+    :+:            ";
echo " +:+  +:+  +:+   ++:      ++:+   +:+          :++       ++:    :+:+########   ";
echo " +#+       +#+   +++      #+++   #++          +#+       +#+    +#+      ###   ";
echo " ###       ###   ###    #####    #########     ###     ###     ###      ###   ";
echo " ###       ###   ### ######      #########       #######        ###########    ";
echo -e "\e[0m"
echo "================================================================================="

echo -e "\e[1m\e[32m1. Delete Folder Massa dan massa.sh... \e[0m" && sleep 1
#delete
rm -rf massa
rm -rf massa-test.sh

echo -e "\e[1m\e[32m2. Updating packages... \e[0m" && sleep 1
# update
sudo apt-get update
sudo apt install screen

echo -e "\e[1m\e[32m3. Installing dependencies... \e[0m" && sleep 1
# packages
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev
sudo apt-get install librocksdb-dev build-essential

echo -e "\e[1m\e[32m4. Downloading and building massa binary... \e[0m" && sleep 1
# download binary
cd $HOME
wget https://github.com/massalabs/massa/releases/download/TEST.11.3/massa_TEST.11.3_release_linux.tar.gz
tar xvzf massa_TEST.11.3_release_linux.tar.gz

echo -e "\e[1m\e[32m4. Install Node Service... \e[0m" && sleep 1
#Install Node Ke Service
sudo tee /root/massa/massa-node/run.sh > /dev/null <<EOF
cd ~/massa/massa-node/
./massa-node |& tee logs.txt
EOF



echo "[Unit]
Description=Massa Node
After=network-online.target

[Service]
Environment="RUST_BACKTRACE=1
User=$USER
ExecStart=/root/massa/massa-node/run.sh
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target

chmod +x /root/massa/massa-node/run.sh
systemctl daemon-reload 
systemctl enable massad 
systemctl restart massad
