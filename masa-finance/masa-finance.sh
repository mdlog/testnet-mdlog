
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


echo -e "\e[1m\e[32m1. Update system... \e[0m" && sleep 1
# update
sudo apt-get update
sudo apt-get list --upgradable
sudo apt-get upgrade -y

echo -e "\e[1m\e[32m1. Install Anaconda... \e[0m" && sleep 1
curl -O https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh
bash Anaconda3-2023.07-2-Linux-x86_64.sh -b
source /root/anaconda3/bin/activate
conda init

echo -e "\e[1m\e[32m1. Install Docker && Docker Compose... \e[0m" && sleep 1
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y 
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo -e "\e[1m\e[32m1. Install Bittensor & Masa-Node... \e[0m" && sleep 1
git clone https://github.com/masa-finance/masa-bittensor.git
cd masa-bittensor
conda create --name bittensor python
conda activate bittensor
pip install -r requirements.txt
export PYTHONPATH=$PYTHONPATH:$(pwd)
cd $HOME
