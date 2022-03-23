FROM golang:buster

LABEL author="Andrew Ares <coldswind@163.com>"

WORKDIR /code

RUN USER=root mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN USER=root cat /dev/null > /etc/apt/sources.list

RUN USER=ROOT cat "deb http://mirrors.ustc.edu.cn/debian/ buster main" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb-src http://mirrors.ustc.edu.cn/debian/ buster main" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb-src http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb http://mirrors.ustc.edu.cn/debian/ buster-updates main" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb-src http://mirrors.ustc.edu.cn/debian/ buster-updates main" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb http://mirrors.ustc.edu.cn/debian/ buster-backports main non-free contrib" >> /etc/apt/sources.list
RUN USER=ROOT cat "deb-src http://mirrors.ustc.edu.cn/debian/ buster-backports main non-free contrib" >> /etc/apt/sources.list

RUN USER=root apt update && apt upgrade -y
RUN USER=root apt-get install -y protobuf-compiler

ENV GOPROXY https://proxy.golang.com.cn,direct
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

COPY . .

RUN go get .

EXPOSE 8080
CMD ["go", "run", "."]
