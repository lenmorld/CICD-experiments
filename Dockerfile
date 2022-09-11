FROM node:latest

RUN mkdir -p /home/app

COPY ./* /home/app

WORKDIR /home/app

RUN npm install

CMD ["node", "server.js"]
