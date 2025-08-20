# Imagen oficial de Moodle con Apache y PHP
FROM moodle:latest

# Exponer el puerto que Render necesita
EXPOSE 8080

# Configurar Moodle para que escuche en el puerto de Render
ENV MOODLE_DOCKER_PORT=8080

# Iniciar Apache en primer plano
CMD ["apache2-foreground"]