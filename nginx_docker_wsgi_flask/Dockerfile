FROM ubuntu
USER root

# 必要なものをインストール
RUN apt-get update && \
    apt-get -y install software-properties-common && \
    apt-get install -y -q python3 python3-pip && \
    apt-get update && \
    apt-get -y install nginx 

# flask、uwsgi、gunicornをインストール
RUN pip3 install --upgrade pip && \
    pip install flask && \
    pip install uwsgi && \
    pip install gunicorn && \
    pip install werkzeug==0.16.0

# アプリケーションをコピー
COPY app /var/app

# Nginxの設定ファイルをコピー
COPY default.conf /etc/nginx/conf.d/default.conf

# gunicornの設定ファイルコピー
COPY gunicorn_settings.py /var/app/gunicorn_settings.py

# 起動
CMD ["/bin/bash", "/var/app/startup.sh"]
