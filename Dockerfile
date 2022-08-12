
FROM alpine:latest
ARG NAME
WORKDIR /app

RUN apk add --update nodejs npm bash curl

COPY src/package*.json /app/
COPY src/run.js /app/

RUN npm ci

ENV APP_NAME ${NAME}

EXPOSE 8080
CMD [ "node", "run.js" ]