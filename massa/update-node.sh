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
systemctl stop massad
cd $HOME/etc/systemd/system
rm -rf massad.service
cd ~
rm -rf buyrolls.sh

mv massa massaold
wget https://github.com/massalabs/massa/releases/download/TEST.12.0/massa_TEST.12.0_release_linux.tar.gz
tar xvzf massa_TEST.12.0_release_linux.tar.gz
clear
cd ~
# cd $HOME/massa/massa-node/config/ && rm -rf config.toml
# cd $HOME/massa/massa-node/config/ && rm -rf node_privkey.key
# cd $HOME/massa/massa-client/ && rm -rf wallet.dat 

cp $HOME/massaold/massa-node/config/config.toml $HOME/massa/massa-node/config/config.toml
cp $HOME/massaold/massa-node/config/node_privkey.key $HOME/massa/massa-node/config/node_privkey.key
cp $HOME/massaold/massa-client/wallet.dat $HOME/massa/massa-client/wallet.dat


clear
sudo tee /root/massa/massa-node/run.sh > /dev/null <<EOF
#!/bin/bash
cd ~/massa/massa-node/
./massa-node -p $PASSWORD |& tee logs.txt
EOF

sudo tee /etc/systemd/system/massad.service > /dev/null <<EOF
[Unit]
Description=Massa Node
After=network-online.target
[Service]
Environment="RUST_BACKTRACE=full"
User=$USER
ExecStart=/root/massa/massa-node/run.sh
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
EOF

chmod +x /root/massa/massa-node/run.sh
systemctl daemon-reload 
systemctl enable massad 
systemctl restart massad
systemctl status massad


#!/bin/bash
# if [ ! $PRIVKEY ]; then
# read -p "Input Priv Key Kamu: " PRIVKEY
# echo 'export PRIVKEY='\"${PRIVKEY}\" >> $HOME/.bash_profile
# fi
# echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
# . $HOME/.bash_profile

# echo -e "Private Key Kamu: \e[1m\e[32m${PRIVKEY}\e[0m"
# echo '================================================='
# PASSWORDKU=$PASSWORD
# KEY=$PRIVKEY
# sleep 1

# Generate New Wallet 
# clear
# cd ~
# chmod +x $HOME/massa/massa-client/massa-client
# cd $HOME/massa/massa-client && wallet_pss=$(./massa-client -p $PASSWORDKU | grep Address )
# cd $HOME/massa/massa-client && wallet_priv_key=$(./massa-client wallet_add_secret_keys $KEY -p $PASSWORDKU | grep "Secret Key" )

clear
cd $HOME
wget -O buyrolls.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/buyrolls.sh && chmod +x buyrolls.sh && screen -xR -S buyrolls ./buyrolls.sh
