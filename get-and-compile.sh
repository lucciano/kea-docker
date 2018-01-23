#!/bin/bash
git clone https://github.com/isc-projects/kea.git /opt/kea && cd /opt/kea && git checkout v1_3_0
cd /opt/kea && autoreconf --install
cd /opt/kea && ./configure --with-dhcp-mysql --enable-debug  --enable-static-link    --enable-shell 
cd /opt/kea && make
cd /opt/kea && make install
