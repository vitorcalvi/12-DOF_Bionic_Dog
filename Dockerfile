
#FROM vcalvi/rpi4-tf-ssh:v1.0
#FROM vcalvi/rpi4-tf-opencv-ssh:v1.0
FROM vcalvi/rpi4-tf-opencv-ssh-orangepi_ai:v1.0

## AUDIO HAT
RUN git clone https://github.com/waveshare/WM8960-Audio-HAT
RUN apt-get install -y \ 
	raspberrypi-kernel-headers \
	raspberrypi-kernel \
	dkms \
	i2c-tools \
	libasound2-plugins


#WORKDIR WM8960-Audio-HAT/
#RUN ./install.sh 


## RESPEAKER
WORKDIR /
RUN git clone https://github.com/respeaker/seeed-voicecard.git
#RUN apt-get -y install \
#	linux-raspi \
#	linux-headers-raspi \
#	linux-image-raspi \

WORKDIR seeed-voicecard/
RUN ./install.sh






