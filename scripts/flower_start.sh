#!/bin/sh

until timeout -t 10 celery -A project inspect ping; do
    >&2 echo "Celery workers not available"
done

echo 'Starting flower'
celery -A project flower
