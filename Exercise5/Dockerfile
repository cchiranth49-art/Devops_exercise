FROM python:3.8-slim

WORKDIR /app

COPY app.py /app/

RUN pip install --no-cache-dir flask docker

EXPOSE 5000

CMD ["python", "app.py"]