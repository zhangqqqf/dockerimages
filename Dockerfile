FROM centos:7

MAINTAINER hearglobal <zhangxin@hearglobal.com>

RUN yum update -y && \
yum install -y wget && \
wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" && \
yum localinstall -y jdk-8u121-linux-x64.rpm && \
rm -f jdk-8u121-linux-x64.rpm && \
yum clean all

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
