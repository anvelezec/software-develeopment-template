FROM python:3.10-slim

WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update \
  && apt-get -y install netcat gcc \
  && apt-get clean

# TODO: Change version if needed
RUN pip install "poetry==1.2.1"
RUN apt install python3-dev libpq-dev -y

COPY poetry.lock pyproject.toml ./

# Project initialization:
RUN poetry config virtualenvs.create false \
  && poetry install --without dev --no-interaction --no-ansi

# Download aws cli
RUN apt-get update && apt-get install curl unzip -y
RUN apt-get install make
