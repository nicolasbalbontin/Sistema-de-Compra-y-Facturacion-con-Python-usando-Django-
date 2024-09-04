FROM python:3
ENV PYTHONUNBUFFERED 1
ENV APP_CORS_ALLOW_ALL true
ENV APP_PROFILE production
ENV ALLOWED_HOSTS *
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip
COPY requirements.txt /code/
# Instala las dependencias especificadas en el archivo requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . /code/
RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/America/Santiago /etc/localtime