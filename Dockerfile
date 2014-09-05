
# Karaf Base Package build

FROM ubuntu:13.10

MAINTAINER YT "yangtao309@gmail.com"

# install jdk

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java

RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

RUN apt-get clean
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# install supervisor
RUN apt-get install -y supervisor

RUN mkdir -p /var/log/supervisor

# install sshd

RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN echo 'root:123456' | chpasswd

RUN sed --in-place=.bak 's/without-password/yes/' /etc/ssh/sshd_config

# install maven

RUN apt-get install -y maven

# install karaf
WORKDIR /home/runner

RUN apt-get update 
RUN apt-get -y install wget
RUN apt-get -y install unzip

RUN wget -q http://repo2.maven.org/maven2/org/apache/karaf/apache-karaf/2.3.4/apache-karaf-2.3.4.tar.gz
RUN tar xzvf apache-karaf-2.3.4.tar.gz; mv apache-karaf-2.3.4 apache-karaf; rm -f apache-karaf-2.3.4.tar.gz  

WORKDIR /home/runner/apache-karaf/etc

# lets remove the karaf.name by default so we can default it from env vars
RUN sed -i '/karaf.name=root/d' system.properties 

# lets add a user - should ideally come from env vars?
ADD datasource.cfg /home/runner/apache-karaf/etc/datasource.cfg

RUN echo >> users.properties 
RUN echo admin=admin,admin >> users.properties 

# lets enable logging to standard out
RUN echo log4j.rootLogger=INFO, stdout, osgi:* >> org.ops4j.pax.logging.cfg 

WORKDIR /home/runner/apache-karaf

# ensure we have a log file to tail 
RUN mkdir -p data/log
RUN echo >> data/log/karaf.log

# add run script 
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
 

# wget nexus tar.gz for package
WORKDIR /tmp
RUN mkdir m2

# expos many ports
EXPOSE 22 8181 8101 1099 2181 9300 61616 

#CMD echo "starting Apache-Karaf container: " 
CMD ["/usr/bin/supervisord"]
 
