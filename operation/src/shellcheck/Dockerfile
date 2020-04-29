FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install shellcheck

ENTRYPOINT [ "shellcheck" ]   