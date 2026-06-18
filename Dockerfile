FROM python:3.12-slim as base

WORKDIR /app

# Python environment and dependencies
RUN python -m pip install --no-cache-dir pip setuptools wheel
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

EXPOSE 8005
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8005"]
