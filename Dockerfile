FROM raspbian/stretch
#LABEL maintainer="Vitones"
RUN apt-get update && apt-get upgrade -y
#RUN apt-get install python3-pip python3-dev -y
#RUN apt-get install wget curl nano git iputils-ping pciutils -y
#RUN apt-get install bash net-tools apt-utils -y

#RUN wget http://192.168.1.50:9000/tensorflow-compilations/intel_OK/tensorflow-2.8.0-cp38-cp38-linux_x86_64.whl 
#RUN pip3 install ./tensorflow-2.8.0-cp38-cp38-linux_x86_64.whl
#RUN pip3 install numpy
#RUN python -c 'import tensorflow as tf; print(tf.__version__)'
#RUN python3 -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

#RUN wget http://192.168.1.50:9000/CUDNN/linux/cudnn-local-repo-ubuntu2004-8.3.3.40_1.0-1_amd64.deb
#RUN dpkg -i cudnn-local-repo-ubuntu2004-8.3.3.40_1.0-1_amd64.deb
#RUN apt-key add /var/cudnn-local-repo-ubuntu2004-8.3.3.40/7fa2af80.pub
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80
#RUN pip3 install tensorflow-gpu
#RUN pip3 install tqdm 


## FROM GTI2801 Manual
#RUN DEBIAN_FRONTEND=noninteractive TZ=America/Sao_Paulo apt-get -y install tzdata
#RUN apt install software-properties-common -y
#RUN add-apt-repository ppa:linuxuprising/libpng12 
#RUN apt update 
#RUN apt install libpng-dev -y
#RUN apt install libx11-dev libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev python-numpy python-tk -y
#RUN apt install libopencv-dev python3-opencv usbutils -y
#RUN apt install libusb-1.0-0-dev sudo -y
RUN apt install udev wget -y
RUN wget http://192.168.1.50:9000/KHADAS-PI-AI-STICK/Orange%20PI%20AI%20Stick/arm7l/GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz -O GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz && tar -zxvf  GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz
RUN apt install  libx11-dev libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev python-numpy python-tk -y
#RUN /GTISDK-Linux_armv7l_v4.5.1.0/source SourceMe.env
RUN apt install python-pip -y
RUN python -m pip install --upgrade
RUN python -m pip install setuptools
#RUN python -m pip install --user Python/Lib/gtiClassify/
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:mypassword' | chpasswd
#RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
