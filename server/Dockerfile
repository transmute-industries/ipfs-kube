FROM node:latest
EXPOSE 8000

RUN mkdir -p /usr/src/server

COPY . /usr/src/server
WORKDIR /usr/src/server
RUN npm install
CMD node index.js