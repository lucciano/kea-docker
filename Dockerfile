FROM ubuntu:17.10

RUN apt-get update && apt-get install -yq git vim build-essential dhcping python python-dev wget

RUN apt-get update && apt-get install -yq dh-autoreconf automake 
RUN apt-get update && apt-get install -yq libssl-dev liblog4cplus-dev libboost-dev libboost-system-dev
RUN apt-get update && apt-get install -yq cmake
RUN apt-get update && apt-get install -yq libmysqlclient-dev

#RUN wget https://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.11-src.tar.gz
#RUN tar zxvf mysql-connector-c-6.1.11-src.tar.gz
#RUN cd mysql-connector-c-6.1.11-src ; cmake -DCMAKE_BUILD_TYPE=Debug ; make ; make install


#RUN cp /opt/kea/src/lib/dhcp/.libs/libkea-dhcp++.so.4 /lib/
#RUN cp /opt/kea/src/lib/asiolink/.libs/libkea-asiolink.so.3 /lib/
#RUN cp /opt/kea/src/lib/exceptions/.libs/libkea-exceptions.so.0 /lib/

COPY get-and-compile.sh /bin/
