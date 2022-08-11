
FROM alpine:latest
ARG NAME
WORKDIR /app

RUN apk add --update nodejs npm bash curl

ENV APP_NAME ${NAME}

EXPOSE 8080
CMD [ "node", "run.js" ]