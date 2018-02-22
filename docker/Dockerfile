# Dockerfile for building Ansible image for Ubuntu 16.04 (Xenial), with as few additional software as possible.
#
# @see https://launchpad.net/~ansible/+archive/ubuntu/ansible
#
# Version  1.0
#

# pull base image
FROM ubuntu:16.04

LABEL maintainer="Nathan Lachenmyer <nathan@morphogen.cc>"
LABEL lastUpdated="2018.02.22"

RUN echo "===> Adding Ansible's PPA..." && \
    apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    \
    echo "===> Installing Packages..." && \
    apt-get update && apt-get install -y \
    ansible \
    openssh-client \
    python-pip \
    sshpass && \
    \
    \
    pip install --upgrade pip pywinrm && \
    \
    \
    echo "===> Cleaning Up..." && \
    rm -rf /var/lib/apt/lists/*  /etc/apt/sources.list.d/ansible.list && \
    \
    \
    echo "===> Adding hosts for convenience..." && \
    echo 'localhost' > /etc/ansible/hosts


# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
