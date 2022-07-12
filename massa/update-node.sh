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
PASSWORDKU=$PASSWORD
systemctl stop massad
cd $HOME/etc/systemd/system && rm -rf massad.service
mv massa massaold

cp massaold/massa-node/config/config.toml massa/massa-node/config/config.toml
cp massaold/massa-node/config/node_privkey.key massa/massa-node/config/node_privkey.key
cp massaold/massa-client/wallet.dat massa/massa-client/wallet.dat
export RUST_BACKTRACE=full

wget https://github.com/massalabs/massa/releases/download/TEST.12.0/massa_TEST.12.0_release_linux.tar.gz
tar xvzf massa_TEST.12.0_release_linux.tar.gz

clear
sudo tee /root/massa/massa-node/run.sh > /dev/null <<EOF
#!/bin/bash
cd ~/massa/massa-node/
./massa-node -p $PASSWORDKU |& tee logs.txt
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
