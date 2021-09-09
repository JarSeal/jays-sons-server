FROM alpine:3.14

EXPOSE 3000
WORKDIR /jsondata

COPY db.json db.json

RUN apk update && \
    apk add --update nodejs npm && \
    npm install -g json-server && \
    apk del npm && \
    adduser -D appuser

USER appuser

ENTRYPOINT ["json-server", "--host", "0.0.0.0"]