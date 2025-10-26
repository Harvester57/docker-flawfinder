# Cf. https://hub.docker.com/_/python
FROM python:3.14.0-alpine@sha256:8373231e1e906ddfb457748bfc032c4c06ada8c759b7b62d9c73ec2a3c56e710

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-10-26"
LABEL author="Florian Stosse"
LABEL description="FlawFinder v2.0.19, built using Python v3.14 Alpine-based image"
LABEL license="MIT license"

# Upgrade packages and pip
RUN apk update && \
    apk upgrade --available && \
    /usr/local/bin/python -m pip install --upgrade pip

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser

ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

COPY requirements.txt .

# Cf. https://pypi.org/project/flawfinder/
RUN pip3 install -r requirements.txt --user --no-cache-dir

ENTRYPOINT [ "flawfinder" ]