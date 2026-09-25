FROM python:3.11-slim
RUN apt-get update && apt-get install -y git curl wget && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 -O /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd
RUN pip install aider-chat
WORKDIR /workspace
CMD ttyd -p $PORT -c ${BASIC_AUTH_USER:-admin}:${BASIC_AUTH_PASSWORD:-password} aider
