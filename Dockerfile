# Usar imagen oficial de Bitnami Moodle
FROM bitnami/moodle:latest

# Exponer el puerto 8080 para Render
EXPOSE 8080

# Copiar tu código Moodle dentro del contenedor
COPY moodle/ /bitnami/moodle

# Variables de entorno necesarias para Bitnami Moodle
ENV MOODLE_DATABASE_TYPE=pgsql \
    MOODLE_DATABASE_HOST=dpg-d2ibvj9r0fns738ug2t0-a.oregon-postgres.render.com \
    MOODLE_DATABASE_PORT=5432 \
    MOODLE_DATABASE_NAME=mentorias \
    MOODLE_DATABASE_USER=mentorias_user \
    MOODLE_DATABASE_PASSWORD=8Hk8hl4Ry7nMxvEq4r1MzFTry5ogFXEb \
    MOODLE_USERNAME=admin \
    MOODLE_PASSWORD=Admin1234* \
    MOODLE_EMAIL=mentoriasgrupalesdiplomaticas@gmail.com \
    MOODLE_SITE_NAME="Mentorías Moodle" \
    MOODLE_SUPPORT_EMAIL=mentoriasgrupalesdiplomaticas@gmail.com

# Comando para iniciar Apache y Moodle (sin nami)
CMD ["/opt/bitnami/scripts/moodle/run.sh"]
