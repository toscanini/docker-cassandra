# Install a more up to date mongodb than what is included in the default ubuntu repositories.

FROM ubuntu
MAINTAINER Kimbro Staken

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
RUN echo "deb http://www.apache.org/dist/cassandra/debian 10x main" | tee -a /etc/apt/sources.list.d/cassandra.list
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y --force-yes install apt-utils cassandra

CMD ["/usr/sbin/cassandra", "-f"] 
