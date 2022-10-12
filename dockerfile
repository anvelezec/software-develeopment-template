FROM python:3.8-slim

WORKDIR /usr/src/app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update \
  && apt-get -y install netcat gcc \
  && apt-get clean \
  && apt install python3-dev libpq-dev -y \
  && apt-get install curl unzip -y \
  && apt-get install make

# Change version if needed
RUN pip install "poetry==1.2.1" 

COPY poetry.lock pyproject.toml ./
COPY src ./

# Project initialization
RUN poetry config virtualenvs.create false \
  && poetry install --without dev --no-interaction --no-ansi
