FROM ubuntu:22.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install npm nodejs
WORKDIR /srv
RUN npm install -g @softwaretechnik/dbml-renderer
RUN nodejs --version
RUN npm --version
RUN npm install -g @dbml/cli
