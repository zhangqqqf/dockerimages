FROM centos:7

MAINTAINER hearglobal <zhangxin@hearglobal.com>

RUN yum update -y && \
yum install -y wget && \
wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm" && \
yum localinstall -y jdk-8u121-linux-x64.rpm && \
rm -f jdk-8u121-linux-x64.rpm && \
yum clean all

# 安装
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
