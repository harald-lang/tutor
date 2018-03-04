FROM ubuntu:16.04
MAINTAINER Harald Lang <harald.lang@in.tum.de>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q -y update
RUN apt-get -q -y upgrade
RUN apt-get -q -y install curl gnupg2

RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

#RUN curl -L https://get.rvm.io | bash -s stable --ruby
#because of rvm issue 4068 on github
RUN curl -L https://get.rvm.io | grep -v __rvm_print_headline | bash -s stable --ruby

#RUN mkdir /var/run/sshd
#RUN echo 'root:password' > /root/passwdfile
#RUN cat /root/passwdfile | chpasswd

RUN apt-get -q -y install build-essential
RUN apt-get -q -y install git-core

# Install node
#RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties python g++ make vim
#RUN add-apt-repository -y ppa:chris-lea/node.js
#not available for 16.04, install normal nodejs instead
RUN apt-get update
RUN apt-get -y install nodejs nodejs-legacy npm
#added
RUN npm install -g bower
RUN apt-get -q -y install busybox-syslogd tmux

RUN apt-get -y install postfix openssh-server sudo ruby-dev libsqlite3-dev

# Install user
RUN useradd -m user

## Install source
ADD . /src

#EXPOSE 22 8080
EXPOSE 8080
ENTRYPOINT ["/src/startup.sh"]
