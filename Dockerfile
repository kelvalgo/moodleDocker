FROM bitnami/moodle:latest

# Exponer el puerto que Render necesita
EXPOSE 8080

# CMD que arranca Moodle + Apache correctamente en Render
CMD ["/bin/bash", "-c", "\
sed -i 's/^Listen .*/Listen ${PORT:-8080}/' /opt/bitnami/apache/conf/httpd.conf && \
mv /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf.disabled && \
/opt/bitnami/scripts/moodle/run.sh"]