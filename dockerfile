
FROM debian

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y \
    git dnsutils curl \
  && apt-get clean \
  && apt-get autoremove -y --purge \
  && rm -rf /var/lib/apt/lists/*
