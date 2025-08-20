FROM bitnami/moodle:latest

# Copiar la carpeta completa moodle/ dentro del contenedor
COPY moodle/ /opt/bitnami/moodle

# Exponer puerto 8080
EXPOSE 8080

# Iniciar Moodle con Bitnami
CMD ["nami", "start", "--foreground", "moodle"]