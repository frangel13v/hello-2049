FROM httpd:2.4-alpine
WORKDIR /opt/httpd
COPY ./public_html/ /usr/local/apache2/htdocs/
EXPOSE 80
