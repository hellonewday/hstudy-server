FROM node:stretch-slim

WORKDIR /src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3030

CMD [ "node", "server.js" ]
