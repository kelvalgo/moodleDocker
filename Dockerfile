FROM bitnami/moodle:latest

# Exponer puerto que Render detecta
EXPOSE 8080

# Comando que inicia Moodle y Apache correctamente en Render
CMD ["/bin/bash", "-c", "\
PORT=${PORT:-8080} && \
sed -i \"s/^Listen .*/Listen $PORT/\" /opt/bitnami/apache/conf/httpd.conf && \
mv /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf.disabled && \
/opt/bitnami/scripts/moodle/run.sh"]