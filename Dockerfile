FROM ubuntu:latest
LABEL maintainer="Pat <ppc5025@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=asia/hong_kong

RUN mkdir -p /home/apps
WORKDIR /home/apps
COPY requirements.txt . /home/apps/

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
    ssh-client \
    curl \
    git \
    python3.9 \
    python3-pip \
    gem \
    openjdk-8-jdk;
    
#    linuxbrew-wrapper locales nodejs zsh wget nano 
#     nodejs npm fonts-powerline && \
#     locale-gen en_US.UTF-8 && \
#     adduser --quiet --disabled-password 
#     --shell /bin/zsh --home /home/devuser 
#     --gecos "User" devuser && \
#     echo "devuser:<a href="mailto://p@ssword1">p@ssword1</a>" | 
#     chpasswd &&  usermod -aG sudo devuser
RUN type pip3

RUN pip3 install -r requirements.txt
RUN apt-get clean;
# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

CMD [ "python3", "./main.py" ]