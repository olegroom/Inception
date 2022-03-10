FROM debian:buster
RUN apt-get update && apt-get -y install nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/nginx.key \
    -out /etc/ssl/nginx.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=MVMGroup/OU=MVM/CN=https:\/\/jino.ru\/rosfryd1/emailAddress=rosfryd1@gmail.com"

COPY tools/nginx.conf /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]
