#!/bin/sh

DB_NAME=$(drush status --fields=db-name --field-labels=0 | tr -d '\r\n ')
drush sqlq "SELECT table_name AS 'Tables', round(((data_length + index_length) / 1024 / 1024), 2) 'Size in MB' FROM information_schema.TABLES WHERE table_schema = \"${DB_NAME}\" ORDER BY (data_length + index_length) DESC;" | head -n20

