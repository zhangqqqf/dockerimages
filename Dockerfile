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

# 安装
RUN yum install -y chrony
# 启用
RUN systemctl start chronyd
# 设置亚洲时区
RUN timedatectl set-timezone Asia/Shanghai
# 启用NTP同步
RUN timedatectl set-ntp yes

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
