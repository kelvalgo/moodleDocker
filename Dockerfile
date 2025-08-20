# Imagen base PHP-Apache (Bitnami) para Moodle
FROM bitnami/moodle:latest

# Copiar tu código Moodle al contenedor
COPY moodle/ /var/www/html/

# Exponer puerto 8080
EXPOSE 8080

# Comando por defecto para iniciar Moodle
CMD ["nami", "start", "--foreground", "moodle"]