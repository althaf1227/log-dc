FROM mysql:5.7
USER root
RUN chmod 777 /var/lib/mysql
# FROM mysql:latest
# COPY script.sql /docker-entrypoint-initdb.d/
COPY init_db.sql /docker-entrypoint-initdb.d/init_db.sql
# RUN -d --name my-mysql-container -e MYSQL_ROOT_PASSWORD=rahasiakominfo my-mysql-image
# RUN apt-get update && apt-get upgrade -y
# RUN docker-php-ext-install mysqli
# Expose 80
# mysql -u root -p my-admin-ci-4 < /docker-entrypoint-initdb.d/init_db.sql