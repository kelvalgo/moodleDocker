FROM bitnami/moodle:latest

# Exponer puerto 8080 para Render
EXPOSE 8080

# Crear directorio de datos en un path escribible
RUN mkdir -p /app/moodledata && \
    chown -R daemon:daemon /app/moodledata

# Configurar Apache para usar el puerto que Render asigna y desactivar HTTPS interno
CMD ["/bin/bash", "-c", "\
PORT=${PORT:-8080} && \
sed -i \"s/^Listen .*/Listen $PORT/\" /opt/bitnami/apache/conf/httpd.conf && \
mv /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf.disabled && \
/opt/bitnami/scripts/moodle/run.sh"]