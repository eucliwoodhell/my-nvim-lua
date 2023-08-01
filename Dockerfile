FROM debian:bullseye-slim

WORKDIR /app

RUN apt-get update \
  && apt-get install -y vim git curl neovim nodejs npm \
  && apt-get clean

COPY .install/run.sh /app/run.sh

CMD ["/bin/bash", "/app/run.sh"]
