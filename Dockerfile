FROM python:bullseye
COPY ../ .
# ENV PYTHONUNBUFFERED=1
# RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
# RUN python3 -m ensurepip
# RUN pip3 install --no-cache --upgrade pip setuptools
# Install GDAL dependencies
# RUN apk add --no-cache geos gdal 
# # Update C env vars so compiler can find gdal
# ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
# ENV C_INCLUDE_PATH=/usr/include/gdal
RUN pip install pandas
RUN pip install shapely
RUN pip install geopandas
# RUN pip install gdal
RUN pip install flask
RUN pip install Flask-API
RUN pip install gunicorn
RUN ["chmod", "+x", "commands.sh"]
RUN ["chmod", "+x", "downloader.py"]
RUN useradd -u 1234 my-user
RUN apt-get update
RUN apt-get -y install cron
COPY example-crontab /etc/cron.d/example-crontab
COPY cron.allow /etc/cron.allow
RUN chmod a+rwx /etc/cron.d/example-crontab && crontab /etc/cron.d/example-crontab
RUN chmod a+rwx downloadertracker.txt
RUN chmod a+rwx commands.sh
# RUN service cron start
EXPOSE 8000
USER my-user
# # RUN pip install -r requirements.txt
# CMD ["Python", "download.py"]
# ENTRYPOINT [ "bash" "commands.sh"]
ENTRYPOINT ["gunicorn" , "--bind", "0.0.0.0:8000", "app:app"]
# CMD [ "gunicorn", "app:app" ]