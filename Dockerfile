# Usar PHP y Apache oficiales
FROM php:8.2-apache

# Instalar extensiones necesarias para Moodle
RUN apt-get update && apt-get install -y \
    libpq-dev git unzip \
    && docker-php-ext-install pdo_pgsql

# Configurar directorio de trabajo
WORKDIR /var/www/html

# Copiar el código de Moodle desde tu repo
COPY . /var/www/html

# Crear directorio de datos escribible
RUN mkdir -p /var/www/moodledata && chown -R www-data:www-data /var/www/moodledata

# Configurar Apache
EXPOSE 8080
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

# Comando para iniciar Apache en primer plano
CMD ["apache2-foreground"]