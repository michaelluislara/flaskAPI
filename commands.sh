#!/bin/bash
# python downloader.py
# /usr/sbin/cron -f
gunicorn --bind 0.0.0.0:8000 app:app