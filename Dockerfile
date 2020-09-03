## Build Command ##
# docker build -t centos7/fluent .

## Run Command ##
#docker run --rm -it \
#            -e DISPLAY=$DISPLAY \
#            -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
#            -v ~/ansys_inc:/usr/ansys_inc \
#            -v ~/trx:/home/ansys/trx \
#            --hostname=YOURHOSTNAME \
#            centos/fluent


FROM centos:7.6.1810
LABEL maintainer="devincprescott@gmail.com"

###################################
##   Update & Get Dependencies   ##
###################################

RUN yum update -y 
RUN yum install -y SDL libSM libmng motif.i686 blas libSM.i686 libnotify openssl11-libs compat-gcc-44 libXfont libpng.i686 postgresql-libs compat-gcc-44-c++ libXft.i686 libpng12 python3-libs compat-libstdc++-33 libXp libpng12.i686 redhat-lsb compat-libstdc++-33.i686 libXp.i686 librdmacm sssd-client.i686 compat-libtiff3 libXpm libstdc++ tbb ftgl libXScrnSaver libstdc++-devel xalan-c gcc-c++ libXt libstdc++-devel.i686 xerces-c glib2.i686 libXt.i686 libstdc++.i686 xorg-x11-fonts-ISO8859-1-75dpi glibc.i686 libXxf86vm libtiff xorg-x11-fonts-cyrillic gstreamer libXxf86vm.i686 libtiff.i686 xterm gtk2 libjpeg-turbo libxkbcommon-x11 zlib gtk2.i686 libjpeg-turbo.i686 motif openmpi-devel openssh-server openssh-clients 
#mesa-dri-drivers
RUN yum clean all

####################################
## Copy over Ansys Fluent Install ##
####################################

RUN mkdir /usr/ansys_inc
#ADD ansys_inc.tar.gz /usr/

## Expose ports
EXPOSE 1055 2325

## Path to mpirun for Fluent, alias for fluent
RUN echo 'export PATH=$PATH:/usr/ansys_inc/v195/fluent/fluent19.5.0/multiport/mpi/lnamd64/ibmmpi/bin' >> ~/.bashrc
RUN echo "alias fluent='/usr/ansys_inc/v195/fluent/bin/fluent'" >> ~/.bashrc
RUN source ~/.bashrc

COPY /etc/machine-id /etc/machine-id
WORKDIR /home/ansys/trx
CMD /usr/ansys_inc/v195/fluent/bin/fluent
