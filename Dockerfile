# Usamos una imagen base de PHP con Apache
FROM php:8.2-apache

# Activar extensiones necesarias para Moodle
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    zip unzip git \
 && docker-php-ext-install mysqli pdo pdo_mysql gd xml

# Copiamos la carpeta moodle al directorio raíz de Apache
COPY moodle/ /var/www/html/

# Creamos el directorio de datos externo para Moodle
RUN mkdir -p /var/www/moodledata \
    && chown -R www-data:www-data /var/www/html /var/www/moodledata

# Configuramos Apache para puerto 8080 (Render lo requiere)
ENV PORT 8080
RUN sed -i "s/Listen 80/Listen ${PORT}/g" /etc/apache2/ports.conf
RUN sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/g" /etc/apache2/sites-available/000-default.conf

# Exponemos el puerto 8080
EXPOSE 8080

# Comando para iniciar Apache en primer plano
CMD ["apache2-foreground"]