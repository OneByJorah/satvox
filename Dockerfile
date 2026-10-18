FROM python:3.11-slim

RUN groupadd -r -g 999 satvox && useradd -r -u 999 -g satvox satvox \
    && mkdir -p /app && chown -R 999:999 /app

WORKDIR /app

COPY --chown=999:999 hub/bridge/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=999:999 hub/bridge/app.py .
COPY --chown=999:999 hub/dashboard /app/dashboard

USER 999:999

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD ["python3", "-c", "import urllib.request; urllib.request.urlopen('http://localhost:8000/health').read()"]

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
