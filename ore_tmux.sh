#!/bin/bash

# 私钥作为第一个参数传入
PrivateKey=$1

# ID 的替换值作为第二个参数传入
ID=$2

# 使用传入的私钥写入到 /home/ubuntu/.config/solana/id.json
echo "$PrivateKey" > /home/ubuntu/.config/solana/$ID.json

# 修改环境变量，将 Solana的二进制文件路径加入到PATH中
export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"

# 给ore脚本执行权限
chmod +x ore

# 再次执行 ore 挖矿命令
while true
do 
   ./ore --rpc https://nameless-blue-pond.solana-mainnet.quiknode.pro/a1c3f257d8e2870a9fb166c12e8bf4e028a781c1 --keypair ~/.config/solana/$ID.json --priority-fee 500000 mine --threads 15
done
