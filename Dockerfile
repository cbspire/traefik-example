
FROM alpine:latest
ARG NAME

USER root
ENV APP_NAME ${NAME}

RUN apk add --update nodejs npm bash curl nano openrc openssh

RUN rc-update add sshd \
    && mkdir /run/openrc \
    && touch /run/openrc/softlevel \
    && sed -ie "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config

 
RUN addgroup user -g 1000 && adduser user -G user -D && \
    echo "user:password" | chpasswd && \
    mkdir /home/user/app

WORKDIR /home/user/app

COPY src/* .
RUN touch /home/user/app/content.txt && chown -R user:user /home/user/app


RUN npm i

CMD ["sh","-c", "rc-status; rc-service sshd start; node /home/user/app/index.js"]