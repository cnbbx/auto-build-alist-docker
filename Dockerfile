FROM alpine:latest

RUN apk upgrade && apk add wget ca-certificates
WORKDIR /opt/alist
RUN wget https://github.com/alist-org/alist/releases/latest/download/alist-linux-arm64.tar.gz && tar -zxvf alist-linux-arm64.tar.gz && rm -rf alist-linux-arm64.tar.gz
RUN chmod +x alist

CMD /opt/alist/alist server

EXPOSE 5244
