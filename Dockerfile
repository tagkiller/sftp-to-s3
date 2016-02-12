FROM ubuntu:14.04
MAINTAINER Brandfolder Developers <developers@brandfolder.com>

# S3 configuration
ENV S3_IDENTITY=NotSet
ENV S3_CREDENTIAL=NotSet
ENV S3_BUCKET=NotSet

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update
RUN apt-get -y install openssh-server
RUN apt-get -y install automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git && \
  cd s3fs-fuse && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install 

RUN mkdir -p /var/run/sshd

COPY entrypoint /
RUN chmod +x /entrypoint 

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
