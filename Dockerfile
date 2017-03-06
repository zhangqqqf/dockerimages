FROM centos:7

MAINTAINER hearglobal <zhangxin@hearglobal.com>

RUN yum update -y && \
yum install -y wget && \
wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
   "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/jdk-8u121-linux-x64.rpm" && \
yum localinstall -y jdk-8u102-linux-x64.rpm && \
rm -f jdk-8u102-linux-x64.rpm && \
yum clean all

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
