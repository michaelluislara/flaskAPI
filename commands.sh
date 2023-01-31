#!/bin/bash
# python downloader.py
sudo service cron start
gunicorn --bind 0.0.0.0:8000 app:app