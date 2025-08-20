# Imagen base PHP + Apache
FROM php:8.2-apache

# Instala extensiones necesarias para Moodle
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-install intl xmlrpc soap zip mysqli pdo pdo_mysql opcache \
    && a2enmod rewrite

# Copia el código de Moodle al contenedor
COPY moodle/ /var/www/html/

# Crea el directorio de datos y da permisos
RUN mkdir /var/www/moodledata \
    && chown -R www-data:www-data /var/www/html \
    && chown -R www-data:www-data /var/www/moodledata

# Expone el puerto para Render
EXPOSE 8080

# Comando para iniciar Apache en primer plano
CMD ["apache2-foreground"]