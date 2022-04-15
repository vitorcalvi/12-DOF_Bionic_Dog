# Docker build
docker build -t vcalvi/rpi4-orangePi-AI-Stick:v1.0 .

#### Docker & Docker compose

```
sudo su -
curl -sSL https://get.docker.com | sh && sudo apt install python3-pip -y && sudo pip3 install docker-compose
```

#### Install NTP Br

```
# Install NTP
apt-get update && apt-get install ntp -y && cp -p /etc/ntp.conf /etc/ntp.conf.default && echo "" > /etc/ntp.conf && echo 'driftfile /var/lib/ntp/ntp.drift' >> /etc/ntp.conf && echo 'server a.ntp.br iburst' >> /etc/ntp.conf && systemctl restart ntp && ntpq -p
```


# WAVEGO
WAVEGO, An Open Source Bionic Dog-Like Robot Powered By Raspberry Pi

- https://www.waveshare.com/wavego.htm
- https://www.waveshare.com/wiki/WAVEGO
