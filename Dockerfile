FROM php:${PHP_VERSION}-apache

RUN apt update && apt install -y zip libzip-dev libpng-dev libicu-dev libxml2-dev cron
RUN docker-php-ext-install mysqli zip gd intl soap

RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl

#COPY costum-cron /etc/cron.d/costum-cron
#RUN chmod 0644 /etc/cron.d/costum-cron && crontab /etc/cron.d/costum-cronù

CMD cron && apache2-foreground

EXPOSE 443
