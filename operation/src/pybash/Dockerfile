FROM python:3.8

RUN apt-get update && apt-get install vim -y

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

ENTRYPOINT [ "/bin/bash" ]