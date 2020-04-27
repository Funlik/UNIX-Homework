FROM ubuntu

COPY configs /usr/configs
COPY configs/crontab /etc/cron.d/cjob
WORKDIR /usr/configs

RUN apt-get update && apt-get install -y samba git
RUN cp smb.conf /etc/samba/smb.conf
RUN chmod 0644 /etc/cron.d/cjob

CMD bash init.sh