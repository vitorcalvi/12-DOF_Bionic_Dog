FROM vcalvi/rpi4-tf-ssh:v1.0

ADD ./Dockerfiles_dir/opencv_install/download-opencv.sh . 
ADD ./Dockerfiles_dir/opencv_install/install-deps.sh .
ADD ./Dockerfiles_dir/opencv_install/build-opencv.sh .
RUN chmod +x *.sh

RUN ./download-opencv.sh
RUN ./install-deps.sh
RUN ./build-opencv.sh

#RUN wget https://gist.githubusercontent.com/willprice/abe456f5f74aa95d7e0bb81d5a710b60/raw/d3d8e2f2b619ff9d266d4614a27962870382ed2e/test.py
WORKDIR /root/opencv/opencv-4.5.5/build
RUN make install




