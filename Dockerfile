FROM golang:1.7.1-alpine
MAINTAINER zhaopan <zhaopan@github.com>

RUN apk add --no-cache git make openssl

RUN git clone https://github.com/inconshreveable/ngrok.git /ngrok

ADD *.sh /

ENV DOMAIN **None**
ENV MY_FILES /myfiles
ENV TUNNEL_ADDR :4443
ENV HTTP_ADDR :80
ENV HTTPS_ADDR :443

EXPOSE 4443
EXPOSE 80
EXPOSE 443

CMD /bin/sh
