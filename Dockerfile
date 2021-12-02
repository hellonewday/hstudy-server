FROM node:stretch-slim

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8088

CMD [ "node", "server.js" ]
