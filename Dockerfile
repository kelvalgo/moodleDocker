# Imagen base con Apache y PHP
FROM php:8.2-apache

# Instalar extensiones necesarias para Moodle y PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev git unzip \
    && docker-php-ext-install pdo_pgsql

# Directorio de trabajo de Apache
WORKDIR /var/www/html

# Copiar solo la carpeta moodle al root de Apache
COPY moodle/ /var/www/html/

# Crear directorio de datos y dar permisos
RUN mkdir -p /var/www/moodledata && chown -R www-data:www-data /var/www/moodledata

# Exponer puerto para Render
EXPOSE 8080

# Variable de entorno para MoodleData
ENV MOODLE_DATA=/var/www/moodledata

# Iniciar Apache en primer plano
CMD ["apache2-foreground"]