FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl git && \
    apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_current.x  | bash -
RUN apt-get install -y nodejs

RUN npm install -g @hubspot/cli

WORKDIR /app

CMD ["bash"]
