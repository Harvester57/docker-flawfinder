FROM dhi.io/python:3-alpine3.23-dev@sha256:2069ad97587fb9356c4b736be1839b182ca346eb193c14b5f53f8822eb1af62c AS builder

ENV LANG=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TZ="Europe/Paris"

WORKDIR /flawfinder
COPY requirements.txt .
RUN python -m venv venv
ENV PATH="/flawfinder/venv/bin:$PATH"

RUN pip install -r /flawfinder/requirements.txt --no-cache-dir

# Cf. https://pypi.org/project/flawfinder/
RUN pip3 install -r requirements.txt --user --no-cache-dir

# Cf. https://hub.docker.com/_/python
FROM dhi.io/python:3-alpine3.23@sha256:103fa51b0bb61180edb7fc04cf41a63362b40764d3a06c88a099a62718a6bcd6

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-10-26"
LABEL author="Florian Stosse"
LABEL description="FlawFinder v2.0.19, built using Python v3.14 Alpine-based image"
LABEL license="MIT license"

WORKDIR /venv

ENV LANG=C.UTF-8
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV TZ="Europe/Paris"
ENV PATH="/venv/bin:$PATH"

COPY --from=builder /flawfinder/venv /venv

ENTRYPOINT [ "flawfinder" ]
