FROM ubuntu:precise

# Set locale to fix character encoding
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies and utilities
RUN apt-get update && apt-get install -y \
  devscripts \
  debian-keyring \
  less \
  vim 

WORKDIR /build

ARG package
ENV PACKAGE=${package}

RUN apt-get -y build-dep ${package}
RUN apt-get source -b ${package}

WORKDIR /packages
RUN mv /build/* /packages/

# Copy build packages to volume
VOLUME /out
CMD cp /packages/* /out/
