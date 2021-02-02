FROM alpine:latest
RUN apk add --no-cache nodejs npm ffmpeg

WORKDIR /app

COPY package*.json /app/

RUN npm install

RUN npm install pm2 -g

COPY . /app

EXPOSE 5000

CMD ["pm2-runtime start server.js -i 0"]
