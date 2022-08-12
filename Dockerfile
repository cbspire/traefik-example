
FROM alpine:3.16
ARG NAME

USER root
ENV APP_NAME ${NAME}

RUN apk add --update nodejs npm bash curl nano openrc openssh \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel

 
RUN addgroup user -g 1000 && adduser user -G user -D && \
    echo "user:password" | chpasswd && \
    mkdir -p /home/user/app

WORKDIR /home/user/app

COPY src/* .
RUN touch /home/user/app/content.txt && chown -R user:user /home/user/app


RUN npm i

CMD ["sh","-c", "rc-status; rc-service sshd start; node /home/user/app/index.js"]