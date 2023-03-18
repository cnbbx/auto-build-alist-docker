FROM alpine:latest

RUN apk upgrade && apk add wget ca-certificates
WORKDIR /opt/alist
RUN wget https://github.com/alist-org/alist/releases/latest/download/alist-linux-mipsle.tar.gz && tar -zxvf alist-linux-mipsle.tar.gz && rm -rf alist-linux-mipsle.tar.gz
RUN chmod +x alist

CMD /opt/alist/alist server

EXPOSE 5244
