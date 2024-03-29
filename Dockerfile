FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev curl

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

HEALTHCHECK --interval=10s --timeout=30s CMD curl --fail http://localhost:5000/ || exit 1

CMD ["python", "app.py"]

STOPSIGNAL SIGKILL