FROM bitnami/moodle:latest

# Exponer el puerto 8080 para que Render lo detecte
EXPOSE 8080

# Comando por defecto para iniciar Moodle
CMD ["nami", "start", "--foreground", "moodle"]