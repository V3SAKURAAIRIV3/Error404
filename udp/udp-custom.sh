#!/bin/bash

cd
rm -rf /root/udp
mkdir -p /root/udp

# change to time GMT+8
echo "change to time GMT+8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -q -O /root/udp/udp-custom "https://raw.githubusercontent.com/V3SAKURAAIRIV3/Error404/main/udp/udp-custom-linux-amd64" && chmod +x /root/udp/udp-custom

echo downloading default config
wget -q -O /root/udp/config.json "https://raw.githubusercontent.com/V3SAKURAAIRIV3/Error404/main/udp/config.json" && chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo type menu