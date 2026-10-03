FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    openssh-server \
    python3 \
    python3-apt \
    sudo \
    iproute2 \
    iputils-ping \
    curl \
    nginx \
    vim && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    usermod -aG sudo ansible && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible

RUN mkdir -p /run/sshd

EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D"]
