# syntax=docker/dockerfile:experimental
FROM python:3.8

# Download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# Bridge futures pip installs to the ssh key path passed in argument
RUN --mount=type=ssh,id=github_ssh_key pip install git+ssh://git@github.com/olympique-de-marseille/aws-helpers.git@master#egg=om-aws-helpers
RUN --mount=type=ssh,id=github_ssh_key pip install git+ssh://git@github.com/olympique-de-marseille/statsbomb-helpers.git@master#egg=om-statsbomb-helpers

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

ENTRYPOINT [ "jupyter", "lab"]