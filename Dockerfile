FROM nginx:alpine-slim
WORKDIR /opt/nginx
COPY ./public_html/ /usr/share/nginx/html
EXPOSE 80
EXPOSE 8080
LABEL org.opencontainers.image.source https://github.com/2000GHz/hello-2048
