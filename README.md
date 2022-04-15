# Docker build
docker build -t vcalvi/rpi4-orangePi-AI-Stick:v1.0 .



## Udev - USB Privilegies on Docker
- https://www.losant.com/blog/how-to-access-serial-devices-in-docker
```
# On host
echo 'KERNEL=="ttyUSB[0-9]*",MODE="0666"' > /etc/udev/rules.d/99-serial.rules
```

## Docker USB Privilegis
```
docker run -itd -v /dev:/dev --privileged vcalvi/rpi4-orange-ai-stick:v1.2 /bin/bash

```

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

### Install GTISDK
```
wget http://192.168.1.50/home/vi/storage/128GB/api/public/dl/al0oQfpc -O GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz && tar -zxvf  GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz

```


# alterar python-opencv para python3-opencv no SourceMe.env



---

## Orange Pi Resources
```
https://drive.google.com/drive/folders/1qCKtRXs45B_wEUp42Y3k9YK9Uja0xooW
```

## WAVEGO
WAVEGO, An Open Source Bionic Dog-Like Robot Powered By Raspberry Pi

- https://www.waveshare.com/wavego.htm
- https://www.waveshare.com/wiki/WAVEGO
