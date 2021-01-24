FROM node:15-slim

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass && \
    apt-get install -y ssh && \
    apt-get install -y vim && \
    apt-get install -y python-simplejson


ENV PORT 8080
EXPOSE 8080
WORKDIR /usr/src/app
COPY . .
CMD ["npm", "start"]
