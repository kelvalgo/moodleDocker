# Usa la imagen oficial de Bitnami Moodle
FROM bitnami/moodle:latest

# Copia tu código de Moodle si quieres sobrescribirlo
COPY moodle/ /bitnami/moodle

# Exponer puerto 8080 para Render
EXPOSE 8080

# Bitnami ya configura Apache/PHP, así que no necesitas CMD extra