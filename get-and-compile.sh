#!/bin/bash
git clone https://github.com/isc-projects/kea.git /opt/kea && cd /opt/kea && git checkout v1_3_0
cd /opt/kea
autoreconf --install
./configure --with-dhcp-mysql --enable-debug  --enable-static-link  --enable-shell 
make -j
make install
