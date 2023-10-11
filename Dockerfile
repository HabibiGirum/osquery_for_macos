FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cmake \
        g++ \
        git \
        libboost-all-dev \
        libssl-dev \
        make \
        python3 \
        python3-pip \
        wget

RUN pip3 install --user setuptools pexpect==3.3 psutil timeout_decorator six thrift==0.11.0 osquery

RUN git clone https://github.com/osquery/osquery.git && \
    cd osquery && \
    mkdir build && cd build && \
    cmake .. && make -j $(nproc)

CMD ["/bin/bash"]
