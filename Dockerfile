FROM bitnami/moodle:latest

# Exponer puerto que Render necesita detectar
EXPOSE 8080

# Arrancar Moodle y Apache usando el puerto asignado por Render
# Deshabilita HTTPS para evitar errores de certificados
CMD ["/bin/sh", "-c", "sed -i 's/^Listen .*/Listen ${PORT}/' /opt/bitnami/apache/conf/httpd.conf && mv /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf.disabled && /opt/bitnami/scripts/moodle/run.sh"]