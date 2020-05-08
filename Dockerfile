FROM python:3.6-slim
MAINTAINER wtakase <wataru.takase@kek.jp>

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y git

RUN git config --global user.email "wataru.takase@kek.jp" && \
    git config --global user.name "Wataru Takase"

ENV GRAFANALIB_DIR /usr/local/lib/python3.6/site-packages/grafanalib
RUN git clone https://github.com/weaveworks/grafanalib.git $GRAFANALIB_DIR
WORKDIR $GRAFANALIB_DIR
RUN git fetch && \
    git checkout 4879379 && \
    git remote add victoriaalee https://github.com/victoriaalee/grafanalib.git && \
    git fetch victoriaalee && \
    git cherry-pick 4f8da5f --strategy-option theirs && \
    git cherry-pick 27f4f67 --strategy-option theirs && \
    pip install -e .

RUN mkdir /work
WORKDIR /work
