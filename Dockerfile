FROM nginx:alpine-slim
WORKDIR /opt/nginx
COPY ./public_html/ /usr/share/nginx/html
EXPOSE 80
