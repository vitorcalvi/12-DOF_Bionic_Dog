## Project 12-dof w/ artifcial brain

FROM raspbian/stretch:latest



RUN apt-get update && apt-get upgrade -y
RUN apt-get update 
# dialog error in the middle of instalation
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN sudo apt-get install -y -q

####################
## INSTALL OPENSSH #
####################

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:1' | chpasswd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


##################
# INSTALL OPENCV #
##################

## https://github.com/opencv/opencv/releases
#ENV OPENCV_VERSION=4.5.4

RUN wget -O - https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/download-opencv.sh | bash
RUN wget -O - https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/install-deps.sh | bash
RUN wget -O - https://gist.githubusercontent.com/vitorcalvi/5482f1a3006f42d4f9a336bcfc557bf0/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/build-opencv.sh | bash
WORKDIR /root/opencv/opencv-4.1.2/build
RUN make install



##############
## TENSORFLOW
##############

#RUN apt-get update && apt-get -y install --no-install-recommends \ 
#	gcc \
#	g++ \
#	gfortran \
#	libopenblas-dev \
#	libblas-dev \
#	liblapack-dev \
#	libatlas-base-dev \
#	libhdf5-dev \
#	libhdf5-100 \
#	pkg-config \
#	python3 \
#	python3-dev \
#	python3-pip \
#	python3-setuptools \
#	pybind11-dev \
#	wget

#RUN python3 -m pip install --upgrade pip
#RUN wget https://storage.googleapis.com/tensorflow/raspberrypi/tensorflow-2.1.0-cp35-none-linux_armv7l.whl
#RUN pip3 install tensorflow-*.whl
#RUN rm *.whl

#RUN apt-get install -y build-essential
#RUN apt-get -y install libjpeg-dev libpng-dev libtiff-dev
#RUN apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
#RUN apt-get -y install libxvidcore-dev libx264-dev
#RUN apt-get install -y python3-dev
#RUN apt-get -y install libgtk2.0-dev



################
## ORANGE PI AI
###############

# DEPENDENCIES
RUN apt-get install usbutils udev -y
RUN apt install \
        libx11-dev \
        libgtk2.0-dev \
        pkg-config \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libjpeg-dev \
        python-numpy \
        python-tk -y

RUN python -m pip install setuptools

# Instalation
RUN wget http://192.168.1.50:9000/KHADAS-PI-AI-STICK/Orange%20PI%20AI%20Stick/GTISDK/arm7l/GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz
RUN tar -zxvf GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz
#RUN install
RUN rm GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz


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


###########################
# DHT11, Telgraf, Grafana #
###########################
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN export RUNLEVEL=1
RUN sudo apt-get install build-essential python-dev -y
RUN git clone https://github.com/adafruit/Adafruit_Python_DHT.git
WORKDIR Adafruit_Python_DHT
RUN python setup.py install


ENTRYPOINT  service ssh start && bash

#EXPOSE 8086
#EXPOSE 3000
