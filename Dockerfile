FROM sipcapture/homer-docker-opensips:latest

# Install the cron service
RUN touch /var/log/cron.log
RUN apt-get update -qq && apt-get install cron mysql-client -y && rm -rf /var/lib/apt/lists/*

# Add our crontab file
RUN echo "30 3 * * * /opt/homer_mysql_rotate.pl >> /var/log/cron.log 2>&1" > /crons.conf
RUN crontab /crons.conf

COPY ./opt/rotation.ini /opt/rotation.ini
COPY schema_data.sql /homer-api/sql/mysql/schema_data.sql
COPY ./etc_opensips/opensips.cfg /etc/opensips/opensips.cfg

COPY run.sh /run.sh
RUN chmod a+rx /run.sh

ENTRYPOINT ["/run.sh"]
