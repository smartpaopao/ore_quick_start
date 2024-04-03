#!/bin/bash

# 让用户输入私钥，并保存到 /home/ubuntu/.config/solana/id.json
read -p "请输入PrivateKey:" user_input
echo "$user_input" > /home/ubuntu/.config/solana/id.json

# 修改环境变量，将Solana的二进制文件路径加入到PATH中
export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"

# 运行ore挖矿命令并在1分钟后自动结束
ore --rpc https://api.mainnet-beta.solana.com --keypair ~/.config/solana/id.json --priority-fee 500000 mine --threads 10 & sleep 60; kill $!
wait $!

# 给ore脚本执行权限
chmod +x ore

# 再次执行ore挖矿命令
while true
do 
   ./ore --rpc https://solana-mainnet.phantom.app/YBPpkkN4g91xDiAnTE9r0RcMkjg0sKUIWvAfoFVJ --keypair ~/.config/solana/id.json --priority-fee 100000 mine --threads 30
done



