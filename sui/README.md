- If you were SELECTED to participate in testnet, you can use following guides to set up fullnode.
- Guides contain placeholder for the testnet GENESIS url, use "raw" github url to one you received in email with instructions.
- Only SELECTED operators will be rewarded.
- These are steps to set up Testnet Node in Service

1. Install Linux dependencies.

```
sudo apt-get update \
&& sudo apt-get install -y --no-install-recommends \
tzdata \
ca-certificates \
build-essential \
libssl-dev \
libclang-dev \
pkg-config \
openssl \
protobuf-compiler \
cmake

```
2. Install Rust.

```
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustc --version
```

3. Clone GitHub SUI repository.
```
cd $HOME
git clone https://github.com/MystenLabs/sui.git
cd sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git checkout -B testnet --track upstream/testnet
```
4. Create directory for SUI db and genesis.

```
mkdir $HOME/.sui
```

5. Download genesis file (instead of placeholder use the link to genesis you received in email).

```
wget -O $HOME/.sui/genesis.blob <USE LINK TO TESTNET GENESIS FROM EMAIL WITH INSTRUCTIONS>
```

6. Make a copy of fullnode.yaml and update path to db and genesis file in it.

```
cp $HOME/sui/crates/sui-config/data/fullnode-template.yaml $HOME/.sui/fullnode.yaml
sed -i.bak "s|db-path:.*|db-path: \"$HOME\/.sui\/db\"| ; s|genesis-file-location:.*|genesis-file-location: \"$HOME\/.sui\/genesis.blob\"| ; s|127.0.0.1|0.0.0.0|" $HOME/.sui/fullnode.yaml
```

7. Build SUI binaries.

```
cargo build --release
mv ~/sui/target/release/sui-node /usr/local/bin/
mv ~/sui/target/release/sui /usr/local/bin/
sui-node -V && sui -V
```

8. Create Service file for SUI Node.

```
echo "[Unit]
Description=Sui Node
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/sui-node --config-path $HOME/.sui/fullnode.yaml
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/suid.service

mv $HOME/suid.service /etc/systemd/system/

sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
```

9. Start SUI Full Node in Service.

```
sudo systemctl restart systemd-journald
sudo systemctl daemon-reload
sudo systemctl enable suid
sudo systemctl restart suid
journalctl -u suid -f
```
