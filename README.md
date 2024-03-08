# Script Error404

 <h2 align="center">AutoScript VPN By Error404 <img src="https://img.shields.io/badge/Version-1.0-blue.svg"></h2>


<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p>
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2011&message=Bullseye&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=18.04 LTS&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=20.04 LTS&color=blue"></p>

<p align="center"><img src="https://img.shields.io/badge/Service-OpenSSH-success.svg"> <img src="https://img.shields.io/badge/Service-Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-Websocket-success.svg"> <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-OHP-success.svg">  <img
src="https://img.shields.io/badge/Service-Xray-success.svg">  <img src= "https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan-success.svg">  <img src="https://img.shields.io/badge/Service-WireGuard-success.svg"> <img src="https://img.shields.io/badge/Service-Shadowsocks-success.svg">

## Commands : <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=powershell&label=Shell&message=Bash%20Script&color=lightgray">


## Port Service

>>> SERVICE & PORT SSH <<<
- OPENSSH        : 22 ; Bebas
- SSH TLS/NTLS   : 443/80
- STUNNEL4       : 222-777
- DROPBEAR       : 109-143
- UDP            : 53 ; Bebas
- DNS            : 1-2288 ; Bebas
- NOOBZ SSL/STD  : 8080/8443
- BADVPN         : 7100-7900
- NGINX          : 81
>>> SERVICE XRAY & PORT VMESS,VLESS,TROJAN <<<
- XRAY WS TLS    : 443
- XRAY WS NTLS   : 80
- XRAY GRPC      : 443

## Update Debian 10
  ```html
 apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
  ```

## Update Ubuntu 20.04
  ```html
 apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && reboot
 ```

## Installation Full Autoscript
  ```html
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/DotyRat/Error404/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
  ```