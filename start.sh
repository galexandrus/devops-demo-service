#!/bin/sh

exec python manage.py makemigrations && python manage.py migrate

if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
  exec python manage.py createsuperuser \
    --noinput \
    --username $DJANGO_SUPERUSER_USERNAME
    --email $DJANGO_SUPERUSER_EMAIL
fi

#exec gunicorn --workers=1 --bind $SERVICE_HOST:$SERVICE_PORT devops_demo.wsgi
exec python manage.py runserver 0.0.0.0:8000

