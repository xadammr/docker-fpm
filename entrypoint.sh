#!/bin/sh 
 

echo "Starting Perl: "
perl /root/perl-fpm.pl &


echo "Starting PHP: "
php-fpm7 -F