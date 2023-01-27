FROM python:3-alpine
COPY . /
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
# Install GDAL dependencies
RUN yum install gdal gdal-devel 
# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal
RUN pip install gdal
RUN pip install -r requirements.txt
CMD [ "gunicorn", "app:app" ]