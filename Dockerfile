FROM bitnami/moodle:latest

# Exponer puerto (Render lo necesita para detectar servicio)
EXPOSE 8080

# Arrancar Moodle y configurar Apache para escuchar en el puerto asignado por Render
CMD ["/bin/sh", "-c", "sed -i \"s/^Listen .*/Listen ${PORT}/\" /opt/bitnami/apache/conf/httpd.conf && /opt/bitnami/scripts/moodle/run.sh"]