FROM python:3.7-alpine

RUN apk update && \
    apk add curl

###
WORKDIR /etc/periodic
ADD crontab ./everymin/crontab
# 실행 권한 부여
RUN chmod a+x /etc/periodic/everymin/crontab

WORKDIR /etc/crontabs
RUN echo "*       *       *       *       *       run-parts /etc/periodic/everymin" >> root
###

# Cron 실행
CMD /usr/sbin/crond -f