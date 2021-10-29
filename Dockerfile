# **************************************
#
# OpenGM Sandbox
#
# ENV: PROD
# VERSION: 3.14
#
# *************************************

FROM alpine:3.14

MAINTAINER XTech-Cloud "xtech.cloud"

ENV container docker

###############################
# install applications
###############################
RUN apk add --no-cache openssh
RUN apk add --no-cache bash

###############################
# allow root login
###############################
RUN sed -i 's/#PermitRootLogin[ ]prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

###############################
# generate ssh key
###############################
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

###############################
# change password
###############################
RUN echo root:ogmsandbox > /root/passwd

RUN mkdir -p /ogm

EXPOSE 22
COPY entry.sh /usr/bin/
RUN chmod +x /usr/bin/entry.sh

ENTRYPOINT ["/usr/bin/entry.sh"]

