FROM alpine:3.14

EXPOSE 3000
WORKDIR /jsondata

RUN apk update
RUN apk add --update nodejs npm
RUN npm install -g json-server

COPY db.json db.json

ENTRYPOINT ["json-server", "-p", "80", "--host", "0.0.0.0"]