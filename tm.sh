#!/bin/bash

# 你的 token（请替换为你实际的 token）
TOKEN="B2HRxn/Hk/QNLXFg0Zw+Q3OWjNGbfYswPtU6nMQLGAE="

# 安装 Docker（如果未安装）
if ! command -v docker &> /dev/null; then
  echo "[+] Docker 未安装，正在自动安装..."
  curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
else
  echo "[+] Docker 已安装，跳过安装步骤"
fi

# 删除旧容器（如果存在）
if docker ps -a --format '{{.Names}}' | grep -q "^tm$"; then
  echo "[+] 检测到旧容器，正在删除..."
  docker rm -f tm
fi

# 拉取并启动容器
echo "[+] 正在启动 Traffmonetizer 容器..."
docker run -d --restart=always --name tm traffmonetizer/cli_v2 start --token "$TOKEN"

# 查看容器日志
echo "[+] 容器启动完成，实时日志如下（按 Ctrl+C 退出日志查看）："
sleep 2
docker logs -f tm
