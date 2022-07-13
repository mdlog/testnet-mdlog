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
cd ~
rm -rf buyrolls.sh

mv massa massaold
wget https://github.com/massalabs/massa/releases/download/TEST.12.1/massa_TEST.12.1_release_linux.tar.gz
tar xvzf massa_TEST.12.1_release_linux.tar.gz
clear
cd ~
cd $HOME/massa/massa-node/config/ && rm -rf node_privkey.key


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
clear
cd
wget -O buyrolls.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/buyrolls.sh && chmod +x buyrolls.sh && screen -xR -S buyrolls ./buyrolls.sh
