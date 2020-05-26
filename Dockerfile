# 基础镜像
FROM alpine:3.11

# 作者
MAINTAINER lupishan

# 添加glibc依赖
RUN apk --no-cache add ca-certificates && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && apk add glibc-2.29-r0.apk

# 安装jre
ADD jre8.tar.gz /usr/java/jdk/

# 设置变量

ENV JAVA_HOME /usr/java/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

# 运行容器的工作目录
WORKDIR /opt
