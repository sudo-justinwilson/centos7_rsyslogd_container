FROM centos:7
MAINTAINER Justin Wilson "sudo.justin.wilson@gmail.com"
FROM docker.io/centos:latest
LABEL version=0.4 title="Rsyslogd container"
ENV PORT 514

# update system:
RUN yum upgrade -y

# install rsyslog:
RUN yum install -y rsyslog

# config files will be added to container /etc/rsyslog.d, change if you want config to be sourced from different dir:
COPY ./rsyslog.d/*.conf /etc/rsyslog.d/

# This can be set with the "PORT" variable at run time...
# listen on port 514, you will still have to specify which port/protocol you want the host to map the port to - IE: -p 514:514/udp:
EXPOSE ${PORT}

# start rsyslogd:
ENTRYPOINT /usr/sbin/rsyslogd -n

