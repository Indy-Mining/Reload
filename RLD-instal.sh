#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*      Reload Masternode       *"
echo "*           SETUP             *"
echo "*                             *"
echo "*******************************"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

IP==$(curl -s4 icanhazip.com)
echo -e "${GREEN}Please enter your private key: (Copy from Windows and right click to paste and press enter)${NC}" 
read KEY
sleep 2
echo ""
echo ""
echo -e "${RED}PLEASE KEEP YOUR HANDS AND FEET INSIDE THE RIDE AT ALL TIMES!${NC}"
sleep 5

sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libminiupnpc-dev libboost-all-dev build-essential libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev git build-essential libtool autoconf-archive autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install nano htop git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev -y 

sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

sudo git clone https://github.com/Indy-Mining/ReloadMN

echo ""
echo ""
echo -e "${GREEN}Moving stuff where it ${RED}NEEDS${NC} to be"
chmod +x /root/ReloadMN/reloadd /root/ReloadMN/reload-cli
mv /root/ReloadMN/reloadd /root/ReloadMN/reload-cli /usr/local/bin
sleep 2
reloadd -daemon
sleep 5
reload-cli stop
sleep 5
echo ""
echo ""
echo -e "${GREEN}Creating the ${RED}Configuration File Now${NC}"
sleep 2
echo "rpcuser="`shuf -i 100000-10000000 -n 1` >> /root/.reload/reload.conf
echo "rpcpassword="`shuf -i 100000-10000000 -n 1` >> /root/.reload/reload.conf
echo "rpcallowip=127.0.0.1" >> /root/.reload/reload.conf
echo "port=24440" >> /root/.reload/reload.conf
echo "staking=1" >> /root/.reload/reload.conf
echo "logtimestamps=1" >> /root/.reload/reload.conf
echo "listen=1" >> /root/.reload/reload.conf
echo "server=1" >> /root/.reload/reload.conf
echo "daemon=1" >> /root/.reload/reload.conf
echo "addnode=149.28.53.180" >> /root/.reload/reload.conf
echo "addnode=207.148.30.13" >> /root/.reload/reload.conf
echo "addnode=68.232.175.91" >> /root/.reload/reload.conf
echo "maxconnections=250" >> /root/.reload/reload.conf
echo "masternode=1" >> /root/.reload/reload.conf
echo "masternodeaddr$IP" >> /root/.reload/reload.conf
echo "masternodeprivkey=$KEY" >> /root/.reload/reload.conf
echo -e "${GREEN}STARTING THE DAEMON${NC}"

reloadd -daemon
sleep 2
echo ""
echo ""
echo -e "Thank you for installing the Reload wallet.  Please move onto the ${RED}NEXT${NC} step."
