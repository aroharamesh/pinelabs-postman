FROM python:3.9.2-alpine

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN apk add build-base

RUN pip install --upgrade pip && pip install --no-cache-dir --upgrade -r /app/requirements.txt && rm -rf /root/.cache/pip

COPY . /app/
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8083", "--root-path", ""]
