FROM python:3.12-slim

WORKDIR /app

COPY delivery_metrics.py .

RUN pip install prometheus-client

EXPOSE 8000

CMD ["python", "delivery_metrics.py"]