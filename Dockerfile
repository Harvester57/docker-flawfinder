# Cf. https://hub.docker.com/_/python
FROM python:3.14-rc-alpine3.21@sha256:b472430404d83a80c95c9387338c09d4e7218632cfb9daed2d3978db4966648d

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-04-27"
LABEL author="Florian Stosse"
LABEL description="FlawFinder v2.0.19, built using Python v3.14.0 Alpine-based image"
LABEL license="MIT license"

RUN apk update && \
    apk upgrade --available

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

# Cf. https://pypi.org/project/flawfinder/
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install --trusted-host files.pythonhosted.org flawfinder==2.0.19 --user