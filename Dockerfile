FROM alpine:3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk --no-cache add \
        curl tar make gcc build-base wget gnupg bash \
        shadow \
        perl-cgi \
        perl-fcgi \
        perl-fcgi-procmanager \
        perl-app-cpanminus \
        perl-module-build perl-module-build-tiny \
        perl-yaml-syck perl-yaml perl-soap-lite perl-ipc-run perl-html-parser perl-libwww \
        perl-http-date perl-dbi perl-dbd-mysql perl-dbd-pg perl-dbd-sqlite perl-plack perl-cgi-psgi perl-gd perl-crypt-openssl-dsa perl-crypt-ssleay \
        perl-utils \
        php7 \
        php7-bcmath \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-simplexml \
        php7-session \
        php7-soap \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip
        
COPY perl-fpm.pl /root/

COPY php.ini /etc/php7/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

COPY entrypoint.sh /root/

RUN groupadd -g 993 nginx
RUN useradd -r -s /bin/false -u 997 -g 993 nginx

ENTRYPOINT ["sh", "/root/entrypoint.sh"]

EXPOSE 9000
EXPOSE 9001
