# pull official base image
#FROM python:3.11.4-slim-buster
#FROM python:3.12.3-slim-buster
#FROM ghcr.io/jumpserver/python:3.12.3-slim-buster
FROM  python:3.13-bookworm
# set work directory
WORKDIR /usr/src/mysite

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install system dependencies
RUN apt-get update && apt-get install -y netcat-openbsd
# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/mysite/entrypoint.sh
RUN chmod +x /usr/src/mysite/entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/mysite/entrypoint.sh"]
