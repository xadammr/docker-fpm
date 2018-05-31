FROM alpine:3.7
RUN apk --no-cache add perl-cgi perl-fcgi perl-fcgi-procmanager
COPY ./ /root/
CMD perl /root/perl-fpm.pl
EXPOSE 9000
