FROM arm32v7/httpd:alpine
ADD ./conf/httpd.conf //usr/local/apache2/conf/httpd.conf
ADD ./conf/httpd-autoindex.conf /etc/httpd/conf.d/autoindex.conf
ADD ./conf/httpd-userdir.conf /etc/httpd/conf.d/userdir.conf
VOLUME /usr/local/apache2/htdocs/
EXPOSE 80
