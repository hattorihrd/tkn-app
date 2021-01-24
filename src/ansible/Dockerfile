FROM python:3.9.0-slim

RUN pip install pip --upgrade
RUN pip install ansible

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass && \
    apt-get install -y ssh && \
    apt-get install -y vim && \
    apt-get install -y expect
WORKDIR /root
ADD . .
