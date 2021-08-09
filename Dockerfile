FROM centos:7
MAINTAINER Hanumanth
LABEL Remarks="This is a dockerfile example for Centos system"
RUN yum -y update && \
yum -y install httpd && \
yum -y install zip && \
yum -y install unzip && \
yum clean all

ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/loxury.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip loxury.zip
RUN cp -rvf loxury/*
RUN rm -rf loxury.zip loxury
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
