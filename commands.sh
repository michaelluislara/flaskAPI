#!/bin/bash
# python downloader.py
service cron start
gunicorn --bind 0.0.0.0:8000 app:app