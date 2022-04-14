FROM ubuntu:latest
LABEL maintainer="Vitones"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3-pip python3-dev python-is-python3 -y
RUN apt-get install wget curl nano git iputils-ping pciutils -y
RUN apt-get install bash net-tools apt-utils -y
#RUN wget http://192.168.1.50:9000/tensorflow-compilations/intel_OK/tensorflow-2.8.0-cp38-cp38-linux_x86_64.whl 
#RUN pip3 install ./tensorflow-2.8.0-cp38-cp38-linux_x86_64.whl
#RUN pip3 install numpy
#RUN python -c 'import tensorflow as tf; print(tf.__version__)'
#RUN python3 -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

RUN wget http://192.168.1.50:9000/CUDNN/linux/cudnn-local-repo-ubuntu2004-8.3.3.40_1.0-1_amd64.deb
RUN dpkg -i cudnn-local-repo-ubuntu2004-8.3.3.40_1.0-1_amd64.deb
RUN apt-key add /var/cudnn-local-repo-ubuntu2004-8.3.3.40/7fa2af80.pub
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80
#RUN pip3 install tensorflow-gpu
#RUN pip3 install tqdm 


## FROM GTI2801 Manual
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt-get -y install tzdata
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:linuxuprising/libpng12 
RUN apt update 
RUN apt install libpng12-0 -y
RUN apt install libx11-dev libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev python-numpy python-tk -y
RUN apt install libopencv-dev python3-opencv usbutils -y
RUN apt install libusb-1.0-0-dev sudo -y
