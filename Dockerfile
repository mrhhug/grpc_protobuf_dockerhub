FROM ubuntu

RUN  \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y build-essential autoconf libtool pkg-config libgflags-dev libgtest-dev clang libc++-dev git curl && \
	git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc && \
	cd /grpc && \
	git submodule update --init && \
	make && \
	make install && \
	cd /grpc/third_party/protobuf/ && \
	make install && \
	cd /grpc && \
	make grpc_cli
