FROM php:8.2-apache

# Instalar extensiones necesarias de Moodle
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install intl xmlrpc soap zip mysqli pdo pdo_mysql opcache \
    && a2enmod rewrite

# Copiar el código de Moodle dentro de Apache
COPY moodle/ /var/www/html/

# Ajustar permisos
RUN chown -R www-data:www-data /var/www/html/

# Exponer puerto 8080
EXPOSE 8080

# Comando para iniciar Apache en primer plano
CMD ["apache2-foreground"]