
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
#WORKDIR examples/
#RUN python AdafruitDHT.py 11 17

