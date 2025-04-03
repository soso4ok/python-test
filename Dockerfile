FROM python:3.10-slim AS base

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1   

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app /app/app

EXPOSE 5000


CMD ["gunicorn", "-b", "0.0.0.0:5000", "app.main:app"]