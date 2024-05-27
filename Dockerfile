FROM python:3.11-slim-bullseye

ENV TZ=Asia/Taipei

COPY requirements.txt .
COPY ./src/ app/src/

# Set timezome to CST
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install git curl -y

# Python environment
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

ENV PYTHONPATH="$PYTHONPATH:/app/src"
