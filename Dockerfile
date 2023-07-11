FROM python:3.9.17 as base

############################################################
# Distro setup
############################################################

WORKDIR /home/src/

RUN apt-get update && \
    apt-get install -y git nano && \
    apt-get install -y git python3-pip python3-virtualenv python3-venv

FROM base as lichess-bot-playground

############################################################
# Repo setup
############################################################

SHELL ["/bin/bash", "-c"]
RUN git clone https://github.com/lichess-bot-devs/lichess-bot
WORKDIR /home/src/lichess-bot

RUN python3 -m venv venv
RUN virtualenv venv -p python3
RUN source ./venv/bin/activate
RUN python3 -m pip install -r requirements.txt

RUN mv config.yml.default config.yml
