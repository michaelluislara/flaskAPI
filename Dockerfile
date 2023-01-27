FROM python:3-alpine
RUN pip install - upgrade pip
RUN pip install - no-cache-dir -r requirements.txt
CMD [ "gunicorn", "app:app" ]