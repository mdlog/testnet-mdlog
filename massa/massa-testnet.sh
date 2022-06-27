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
read -p "Input IP Server Kamu: " IP_SERVER
echo 'export IP_SERVER='\"${IP_SERVER}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "IP Server Kamu: \e[1m\e[32m${IP_SERVER}\e[0m"
echo '================================================='
sleep 1

#delete folder
rm -rf massa
rm -rf massa-test.sh
rm -rf massa-testnet.sh
rm -rf massa_TEST.11.3_release_linux.tar.gz

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt-get update
sudo apt install screen
echo -e "\e[1m\e[32m2. Installing dependencies... \e[0m" && sleep 1

# packages
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev
sudo apt-get install librocksdb-dev build-essential

echo -e "\e[1m\e[32m3. Downloading and building massa binary... \e[0m" && sleep 1
# download binary dan ekstrak
cd $HOME
wget https://github.com/massalabs/massa/releases/download/TEST.11.3/massa_TEST.11.3_release_linux.tar.gz
tar xvzf massa_TEST.11.3_release_linux.tar.gz
cd massa/massa-node/base_config && rm -rf config.toml
wget https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/config.toml
cd $HOME
cd massa/massa-node/config
wget https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/massa/config.toml
sed -i -e "s/^routable_ip *=.*/routable_ip = \"$IP_SERVER\"/" $HOME/massa/massa-node/config/config.toml

sudo tee /root/massa/massa-node/run.sh > /dev/null <<EOF
#!/bin/bash
cd ~/massa/massa-node/
./massa-node |& tee logs.txt
EOF

sudo tee /etc/systemd/system/massad.service > /dev/null <<EOF
[Unit]
Description=Massa Node
After=network-online.target
[Service]
Environment="RUST_BACKTRACE=1"
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

echo -e "\e[1m\e[32m3. Jalankan massa-client... \e[0m" && sleep 120

#!/bin/bash
#Thank's for https://raw.githubusercontent.com/bobu4/massa/main/bal.sh

rm -f $HOME/massa/massa-client/massa-client
if [ ! -e $HOME/massa/massa-client/massa-client ]; then
  wget https://raw.githubusercontent.com/razumv/helpers/main/massa/massa-client -O $HOME/massa/massa-client/massa-client
  chmod +x $HOME/massa/massa-client/massa-client
fi
#
cd $HOME/massa/massa-client && generate_address=$(./massa-client wallet_generate_private_key | grep Address | awk '{ print $2 }')
massa_wallet_address=$(./massa-client wallet_info | grep Address | awk '{ print $2 }')
while true
do
        balance=$(./massa-client wallet_info | grep "Final balance" | awk '{ print $3 }')
        int_balance=${balance%%.*}
        if [ $int_balance -gt "99" ]; then
                echo "More than 99"
                resp=$(./massa-client buy_rolls $massa_wallet_address $(($int_balance/100)) 0)
                echo $resp
        elif [ $int_balance -lt "100" ]; then
                echo "Less than 100"
        fi
        printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
