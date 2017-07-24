FROM ubuntu:17.04

RUN echo 'Acquire::http { Proxy "http://200.50.168.30:3142"; };' > /etc/apt/apt.conf.d/01proxy

RUN apt-get update && apt-get install -yq git vim build-essential dhcping python python-dev wget

RUN apt-get update && apt-get install -yq dh-autoreconf automake 
RUN apt-get update && apt-get install -yq libssl-dev liblog4cplus-dev libboost-dev libboost-system-dev
RUN apt-get update && apt-get install -yq cmake
#RUN apt-get update && apt-get install -yq libmysqlclient-dev

RUN wget https://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.11-src.tar.gz
RUN tar zxvf mysql-connector-c-6.1.11-src.tar.gz
RUN cd mysql-connector-c-6.1.11-src ; cmake -DCMAKE_BUILD_TYPE=Debug ; make ; make install


RUN git clone https://github.com/isc-projects/kea.git /opt/kea && cd /opt/kea && git checkout v1_2_0
RUN cd /opt/kea && autoreconf --install
RUN cd /opt/kea && ./configure --with-dhcp-mysql --enable-debug  --enable-static-link    --enable-shell 
RUN cd /opt/kea && make
RUN cd /opt/kea && make install


#RUN cp /opt/kea/src/lib/dhcp/.libs/libkea-dhcp++.so.4 /lib/
#RUN cp /opt/kea/src/lib/asiolink/.libs/libkea-asiolink.so.3 /lib/
#RUN cp /opt/kea/src/lib/exceptions/.libs/libkea-exceptions.so.0 /lib/

RUN rm /etc/apt/apt.conf.d/01proxy


