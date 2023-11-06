FROM ubuntu:22.04 as build

RUN useradd -u 5000 app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update

RUN apt-get install python3.10 -y \
    && apt-get install python3-pip -y

FROM build

WORKDIR /app

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY app /app

ARG host=0.0.0.0
ARG port=3000

ENV HOST=$host
ENV PORT=$port

USER app:app

CMD flask run --host ${HOST} --port ${PORT}
