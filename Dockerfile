FROM arm32v7/httpd:alpine
MAINTAINER Jimes Yang <sndnvaps@gmail.com>
ADD ./conf/httpd.conf //usr/local/apache2/conf/httpd.conf
ADD ./conf/httpd-autoindex.conf /etc/httpd/conf.d/autoindex.conf
VOLUME /usr/local/apache2/htdocs/
#if use https,need to expose 80 && 443
EXPOSE 80
