# daemon runs in the background
# run something like tail /var/log/nibbled/current to see the status
# be sure to run with volumes, ie:
# docker run -v $(pwd)/nibbled:/var/lib/nibbled -v $(pwd)/wallet:/home/nibble --rm -ti nibble:0.2.2
ARG base_image_version=0.10.0
FROM phusion/baseimage:$base_image_version

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.2.2/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

ADD https://github.com/just-containers/socklog-overlay/releases/download/v2.1.0-0/socklog-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/socklog-overlay-amd64.tar.gz -C /

ARG TURTLECOIN_BRANCH=master
ENV TURTLECOIN_BRANCH=${TURTLECOIN_BRANCH}

# install build dependencies
# checkout the latest tag
# build and install
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      python-dev \
      gcc-4.9 \
      g++-4.9 \
      git cmake \
      libboost1.58-all-dev && \
    git clone https://github.com/nibble/nibble.git /src/nibble && \
    cd /src/nibble && \
    git checkout $TURTLECOIN_BRANCH && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_CXX_FLAGS="-g0 -Os -fPIC -std=gnu++11" .. && \
    make -j$(nproc) && \
    mkdir -p /usr/local/bin && \
    cp src/Nibbled /usr/local/bin/Nibbled && \
    cp src/walletd /usr/local/bin/walletd && \
    cp src/zedwallet /usr/local/bin/zedwallet && \
    cp src/miner /usr/local/bin/miner && \
    strip /usr/local/bin/Nibbled && \
    strip /usr/local/bin/walletd && \
    strip /usr/local/bin/zedwallet && \
    strip /usr/local/bin/miner && \
    cd / && \
    rm -rf /src/nibble && \
    apt-get remove -y build-essential python-dev gcc-4.9 g++-4.9 git cmake libboost1.58-all-dev librocksdb-dev && \
    apt-get autoremove -y && \
    apt-get install -y  \
      libboost-system1.58.0 \
      libboost-filesystem1.58.0 \
      libboost-thread1.58.0 \
      libboost-date-time1.58.0 \
      libboost-chrono1.58.0 \
      libboost-regex1.58.0 \
      libboost-serialization1.58.0 \
      libboost-program-options1.58.0 \
      libicu55

# setup the nibbled service
RUN useradd -r -s /usr/sbin/nologin -m -d /var/lib/nibbled nibbled && \
    useradd -s /bin/bash -m -d /home/nibble nibble && \
    mkdir -p /etc/services.d/nibbled/log && \
    mkdir -p /var/log/nibbled && \
    echo "#!/usr/bin/execlineb" > /etc/services.d/nibbled/run && \
    echo "fdmove -c 2 1" >> /etc/services.d/nibbled/run && \
    echo "cd /var/lib/nibbled" >> /etc/services.d/nibbled/run && \
    echo "export HOME /var/lib/nibbled" >> /etc/services.d/nibbled/run && \
    echo "s6-setuidgid nibbled /usr/local/bin/Nibbled" >> /etc/services.d/nibbled/run && \
    chmod +x /etc/services.d/nibbled/run && \
    chown nobody:nogroup /var/log/nibbled && \
    echo "#!/usr/bin/execlineb" > /etc/services.d/nibbled/log/run && \
    echo "s6-setuidgid nobody" >> /etc/services.d/nibbled/log/run && \
    echo "s6-log -bp -- n20 s1000000 /var/log/nibbled" >> /etc/services.d/nibbled/log/run && \
    chmod +x /etc/services.d/nibbled/log/run && \
    echo "/var/lib/nibbled true nibbled 0644 0755" > /etc/fix-attrs.d/nibbled-home && \
    echo "/home/nibble true nibble 0644 0755" > /etc/fix-attrs.d/nibble-home && \
    echo "/var/log/nibbled true nobody 0644 0755" > /etc/fix-attrs.d/nibbled-logs

VOLUME ["/var/lib/nibbled", "/home/nibble","/var/log/nibbled"]

ENTRYPOINT ["/init"]
CMD ["/usr/bin/execlineb", "-P", "-c", "emptyenv cd /home/nibble export HOME /home/nibble s6-setuidgid nibble /bin/bash"]
