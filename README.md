# Docker build
docker build -t vcalvi/rpi4-orangepi-ai-stick:v1.0 .



## Udev - USB Privilegies on Docker
- https://www.losant.com/blog/how-to-access-serial-devices-in-docker
```
# On host
echo 'KERNEL=="ttyUSB[0-9]*",MODE="0666"' > /etc/udev/rules.d/99-serial.rules
```

## Docker USB Privilegis
```
docker run -itd -v /dev:/dev -p 2222:22 --privileged -v /opt/vc:/opt/vc --env LD_LIBRARY_PATH=/opt/vc/lib vcalvi/rpi4-orangepi-ai-stick:v1.0
docker exec -it 82fbfcd90ac2 /bin/bash

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
wget http://192.168.1.50:9000/KHADAS-PI-AI-STICK/Orange%20PI%20AI%20Stick/arm7l/GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz -O GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz && tar -zxvf  GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz

```

## Camera on Docker
- https://www.losant.com/blog/how-to-access-the-raspberry-pi-camera-in-docker
- 

# alterar python-opencv para python3-opencv no SourceMe.env

## SSH on Container
- https://adamtheautomator.com/ssh-into-docker-container/

## zsh on docker
- https://github.com/deluan/zsh-in-docker

## Install opencv
```


---

## Orange Pi Resources
```
https://drive.google.com/drive/folders/1qCKtRXs45B_wEUp42Y3k9YK9Uja0xooW
```

## WAVEGO
WAVEGO, An Open Source Bionic Dog-Like Robot Powered By Raspberry Pi

- https://www.waveshare.com/wavego.htm
- https://www.waveshare.com/wiki/WAVEGO
