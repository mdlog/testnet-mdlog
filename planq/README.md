wget https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/planq/wd-matic.sh \
&& chmod +x start.sh \
&& ./start.sh -b BINARY -k KEY_NAME -s SLEEP_TIME -p RPC_PORT -t TG_TOKEN -c TG_CHANNEL


Example:
wget https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/planq/wd-matic.sh && chmod +x start.sh && ./start.sh -b planqd -k $NODENAME -s 600m -p 33657 -t 5509813677:AAHUX7kAMuW0aF1Zx3NDq5ZxzUx6yJWXHZM -c 485873863
