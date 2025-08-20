# Usamos la imagen oficial de Moodle con Apache y PHP
FROM bitnami/moodle:latest

# Copiamos el contenido de la carpeta moodle local al directorio de Moodle del contenedor
COPY moodle/ /bitnami/moodle

# Aseguramos permisos correctos para que Moodle pueda escribir
USER root
RUN chown -R 1001:1001 /bitnami/moodle /bitnami/moodledata
USER 1001

# Exponemos el puerto que Render detectará
EXPOSE 8080

# Comando por defecto para iniciar Moodle
CMD ["nami", "start", "--foreground", "moodle"]
