# Usamos PHP con Apache
FROM php:8.2-apache

# Instalar extensiones necesarias
RUN apt-get update && apt-get install -y libpq-dev unzip git \
    && docker-php-ext-install pdo_pgsql

# Copiar todo el contenido del proyecto al DocumentRoot
COPY . /var/www/html/

# Crear directorio de datos con permisos correctos
RUN mkdir -p /var/www/moodledata && chown -R www-data:www-data /var/www/moodledata

# Exponer puerto 8080 para Render
EXPOSE 8080

# Variable de entorno para el directorio de datos
ENV MOODLE_DATA=/var/www/moodledata
ENV PORT=8080

# Configurar Apache para escuchar en el puerto 8080
RUN sed -i "s/Listen 80/Listen ${PORT}/g" /etc/apache2/ports.conf
RUN sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/g" /etc/apache2/sites-available/000-default.conf

# Iniciar Apache en primer plano
CMD ["apache2-foreground"]