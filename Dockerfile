FROM python:3.7-alpine

RUN apk update && \
    apk add --no-cache curl cron

# crontab 파일을 cron 디렉토리에 추가
ADD crontab /etc/cron.d/hello-cron
# 실행 권한 부여
RUN chmod 0644 /etc/cron.d/hello-cron
# Cron 실행
CMD cron -f