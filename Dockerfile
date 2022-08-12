
FROM alpine:latest
ARG NAME

USER root
ENV APP_NAME ${NAME}

RUN apk add --update nodejs npm bash curl nano openrc openssh

RUN rc-update add sshd \
    && mkdir /run/openrc \
    && touch /run/openrc/softlevel \
    && sed -ie "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config

RUN mkdir /app 
RUN addgroup user -g 1000 && adduser user -G user -D && \
    chown user:user -R /app && \
    echo "user:password" | chpasswd

WORKDIR /app

COPY src/package*.json /app/
COPY src/run.js /app/

RUN npm ci

EXPOSE 8080
CMD ["sh","-c", "rc-status; rc-service sshd start; node /app/run.js"]