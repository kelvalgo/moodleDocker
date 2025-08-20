FROM php:8.2-apache

# Instalar extensiones necesarias
RUN apt-get update && apt-get install -y libpq-dev git unzip \
    && docker-php-ext-install pdo_pgsql

# Copiar la carpeta moodle al directorio raíz de Apache
COPY moodle/ /var/www/html/

# Crear directorio de datos y permisos
RUN mkdir -p /var/www/moodledata && chown -R www-data:www-data /var/www/moodledata

# Exponer puerto 8080
EXPOSE 8080

# Variable de entorno para MoodleData
ENV MOODLE_DATA=/var/www/moodledata

# Iniciar Apache en primer plano (modo foreground)
CMD ["apache2-foreground"]