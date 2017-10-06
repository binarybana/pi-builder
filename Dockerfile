FROM ubuntu:16.04
MAINTAINER Jason Knight

RUN apt-get update && apt-get install build-essential -y
RUN apt-get install gcc-4.7-multilib-arm-linux-gnueabihf -y
RUN apt-get install curl -y
RUN bash -c 'curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y'
RUN bash -c 'source $HOME/.cargo/env && rustup target add arm-unknown-linux-musleabihf'
COPY config $HOME/.cargo/config
RUN echo "source $HOME/.cargo/env" >> $HOME/.bashrc
