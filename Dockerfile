# Usar imagen base oficial de PHP + Apache
FROM php:8.2-apache

# Copiar el código de Moodle
COPY moodle/ /var/www/html/

# Habilitar mod_rewrite de Apache
RUN a2enmod rewrite

# Instalar extensiones PHP necesarias para Moodle
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    git \
 && docker-php-ext-install intl xmlrpc soap zip mysqli pdo pdo_mysql opcache

# Exponer el puerto que Render va a usar
EXPOSE 8080

# Comando para iniciar Apache en primer plano
CMD ["apache2-foreground"]