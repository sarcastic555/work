#!/bin/bash

# アプリケーションディレクトリに移動
cd /var/app

# nginx起動
nginx -g "daemon off;" &

# gunicorn起動
gunicorn app:app -c gunicorn_settings.py

# uwsgi起動
#uwsgi --socket 127.0.0.1:3031 --chdir /var/app/ --wsgi-file app.py --callable app --master --processes 4 --threads 2
