FROM node:stretch-slim

WORKDIR /src

COPY package*.json ./

RUN npm install --only=production

RUN npm install -g pm2

RUN sudo apt-get ca-certificates

COPY . .

EXPOSE 3030

CMD [ "pm2-runtime", "start", "server.js", "-i", "max" ]