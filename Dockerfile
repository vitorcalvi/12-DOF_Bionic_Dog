FROM raspbian/stretch
#LABEL maintainer="Vitones"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget curl nano git iputils-ping -y
RUN apt-get install net-tools apt-utils -y

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

RUN apt-get install usbutils -y
RUN apt install udev wget -y
RUN wget http://192.168.1.50:9000/KHADAS-PI-AI-STICK/Orange%20PI%20AI%20Stick/arm7l/GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz -O GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz && tar -zxvf  GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz

RUN apt install  libx11-dev libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev python-numpy python-tk -y
RUN apt install python-pip -y
RUN python -m pip install --upgrade
RUN python -m pip install setuptools

#RUN python -m pip install --user Python/Lib/gtiClassify/
RUN rm GTISDK-Linux_armv7l_v4.5.1.0_190823.tgz


#RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
#    -t https://github.com/denysdovhan/spaceship-prompt \
#    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
#    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
#    -p git \
#    -p ssh-agent \
#    -p https://github.com/zsh-users/zsh-autosuggestions \
#    -p https://github.com/zsh-users/zsh-completions

#RUN pip install scikit-build
#RUN pip install opencv-python
RUN wget https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/build-opencv.sh
RUN wget https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/download-opencv.sh
RUN wget https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/install-deps.sh
RUN wget https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/test.py
RUN chmod +x *.sh
RUN ./download-opencv.sh
RUN ./install-deps.sh
RUN ./build-opencv.sh
WORKDIR /root/opencv/opencv-4.1.2/build
RUN make install


## SERVER OPENSSH
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:1' | chpasswd
<<<<<<< HEAD
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
=======
>>>>>>> c7351f01a3738d00daf9347ea43d904861a736e2
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
