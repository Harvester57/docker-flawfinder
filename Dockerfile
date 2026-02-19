# Cf. https://hub.docker.com/_/python
FROM dhi.io/python:3-alpine3.23@sha256:103fa51b0bb61180edb7fc04cf41a63362b40764d3a06c88a099a62718a6bcd6

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-10-26"
LABEL author="Florian Stosse"
LABEL description="FlawFinder v2.0.19, built using Python v3.14 Alpine-based image"
LABEL license="MIT license"

COPY requirements.txt .

# Cf. https://pypi.org/project/flawfinder/
RUN pip3 install -r requirements.txt --user --no-cache-dir

ENTRYPOINT [ "flawfinder" ]
