
FROM vcalvi/rpi4-tf-opencv-ssh-orangepi_ai:v1.0

##############
## AUDIO HAT #
##############

WORKDIR /
RUN git clone https://github.com/waveshare/WM8960-Audio-HAT


RUN apt-get install -y \ 
	raspberrypi-kernel-headers \
	raspberrypi-kernel \
	dkms \
	i2c-tools \
	libasound2-plugins


#WORKDIR WM8960-Audio-HAT/
#RUN ./install.sh 


##############
## RESPEAKER #
##############
RUN git clone https://github.com/respeaker/seeed-voicecard.git

#WORKDIR seeed-voicecard/
#RUN ./install.sh


#######
# UPS #
#######
# https://github.com/geeekpi/upsplus
RUN git clone https://github.com/geeekpi/upsplus
#WORKDIR upsplus/
#RUN ./install.sh


######
# DHT11
#######
RUN sudo apt-get install build-essential python-dev -y
RUN git clone https://github.com/adafruit/Adafruit_Python_DHT.git
WORKDIR Adafruit_Python_DHT
RUN python setup.py install

## InfluxDB
#RUN wget -qO- https://repos.influxdata.com/influxdb.key | sudo tee /etc/apt/sources.list.d/influxdb.list test $VERSION\_ID = "8" && echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list test $VERSION\_ID = "9" && echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

RUN apt-get update && apt-get install influxdb -y
ENTRYPOINT service influxdb start && service ssh start && && bash
#CMD ["/usr/sbin/sshd", "-D"]

## Telgraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf_1.22.2-1_armhf.deb 
RUN dpkg -i telegraf_1.22.2-1_armhf.deb

## Grafana
RUN apt-get install -y gnupg2 curl software-properties-common
RUN curl https://packages.grafana.com/gpg.key | sudo apt-key add -

RUN sudo apt-get update
RUN apt-get -y install grafana

RUN systemctl enable --now grafana-server
