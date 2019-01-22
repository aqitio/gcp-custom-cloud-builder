FROM launcher.gcr.io/google/ubuntu16_04

ARG PACKER_VERSION=1.3.3

RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        make \
        software-properties-common \
        unzip \
        jq && \
    curl -o packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer.zip && \
    mv packer /usr/bin/ && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       xenial \
       edge" && \
    apt-get -y update && \
    apt-get -y install docker-ce=5:18.09.0~3-0~ubuntu-xenial

ENTRYPOINT ["/usr/bin/packer"]