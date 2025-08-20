FROM bitnami/moodle:latest

# Puerto que Render usará
ENV PORT=8080
EXPOSE 8080

# Forzar Apache a escuchar en $PORT y arrancar Moodle
CMD ["/bin/sh", "-c", "sed -i 's/^Listen .*/Listen $PORT/' /opt/bitnami/apache/conf/httpd.conf && /opt/bitnami/scripts/moodle/run.sh"]