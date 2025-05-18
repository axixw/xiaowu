#!/bin/bash
# 安装gost，账号密码固定为hackenjoy，端口10800

user="axi"
passwd="lbxx9527"
port="9999"

# 更新系统并安装依赖
apt update && yum update
apt install wget curl gunzip -y || yum install wget curl gunzip -y

# 下载并安装gost
wget https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz
gunzip gost-linux-amd64-2.11.1.gz
mv gost-linux-amd64-2.11.1 /usr/local/bin/gost
chmod +x /usr/local/bin/gost

# 创建systemd服务
cat > /etc/systemd/system/gost.service << EOF
[Unit]
Description=Gost Proxy
After=network.target
Wants=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/gost -L ${user}:${passwd}@:${port} socks5://:${port}
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# 启动服务并设置开机自启
systemctl daemon-reload
systemctl enable gost.service
systemctl restart gost.service

echo -e "\033[0;32m安装完成！socks5 代理运行在端口 ${port}，账号密码均为 ${user}\033[0m"
