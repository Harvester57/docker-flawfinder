# Cf. https://hub.docker.com/_/python
FROM python:3.10.9-alpine3.16

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2022-07-09"
LABEL author "Florian Stosse"
LABEL description "FlawFinder v2.0.19, built using Python v3.10.4 Alpine-based image"
LABEL license "MIT license"

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

# Cf. https://pypi.org/project/flawfinder/
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install --trusted-host files.pythonhosted.org flawfinder==2.0.19 --user
