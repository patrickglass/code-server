##############################################################################
# code-server - custom development image
##############################################################################

ARG CODE_SERVER_VERSION=latest

FROM codercom/code-server:${CODE_SERVER_VERSION}

ARG PACKER_VERSION=1.7.0
ARG VAULT_VERSION=1.6.3
ARG CONSUL_VERSION=1.9.4
ARG TERRAFORM_VERSION=0.14.8

RUN sudo apt-get update && \
    sudo apt-get install -y wget unzip gnupg2 dnsutils software-properties-common && \
    sudo apt clean all

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    sudo apt-get update && \
    sudo apt-get install -y vault=${VAULT_VERSION} consul=${CONSUL_VERSION} terraform=${TERRAFORM_VERSION} packer=${PACKER_VERSION} && \
    sudo apt clean all
