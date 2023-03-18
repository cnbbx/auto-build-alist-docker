FROM alpine:latest

RUN apk upgrade && apk add wget ca-certificates
WORKDIR /opt/alist
RUN wget https://github.com/alist-org/alist/releases/latest/download/alist-linux-musl-amd64.tar.gz && tar -zxvf alist-linux-musl-amd64.tar.gz && rm -rf alist-linux-musl-amd64.tar.gz
RUN chmod +x alist
RUN /opt/alist/alist admin > /opt/alist/data/password.txt
RUN sed -i 's/"cdn":[^,]*/"cdn":"https:\/\/npm.elemecdn.com\/alist-web@$version\/dist\/"/' /opt/alist/data/config.json

CMD /opt/alist/alist server

EXPOSE 5244
