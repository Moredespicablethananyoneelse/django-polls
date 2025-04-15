# pull official base image
#FROM python:3.11.4-slim-buster
#FROM python:3.12.3-slim-buster
#FROM ghcr.io/jumpserver/python:3.12.3-slim-buster
FROM  python:3.13-bookworm
# set work directory
WORKDIR /usr/src/polls

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .
