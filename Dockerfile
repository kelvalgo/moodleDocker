FROM bitnami/moodle:latest

# Puerto que Render asigna
ENV PORT=8080

# Exponer puerto
EXPOSE 8080

# Iniciar Moodle y forzar Apache a escuchar en el puerto asignado
CMD ["/bin/sh", "-c", "sed -i 's/^Listen .*/Listen $PORT/' /opt/bitnami/apache/conf/httpd.conf && nami start --foreground moodle"]