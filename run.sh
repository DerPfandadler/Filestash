#!/usr/bin/with-contenv bashio

# Get port configurations from the environment
FILESTASH_PORT=$(bashio::config 'filestash_port')
ONLYOFFICE_PORT=$(bashio::config 'onlyoffice_port')

# Update supervisord configuration with user-defined ports
sed -i "s/--http_port=8088/--http_port=${ONLYOFFICE_PORT}/" /etc/supervisor/conf.d/supervisord.conf
sed -i "s/--port 8334/--port ${FILESTASH_PORT}/" /etc/supervisor/conf.d/supervisord.conf

# Start supervisord to manage OnlyOffice and Filestash
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf