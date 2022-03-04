# Cf. https://hub.docker.com/_/python/
FROM python:3.10.2-alpine3.15

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "10-12-2021"
LABEL author "Florian Stosse"
LABEL description "FlawFinder v2.0.19, built using Python v3.10.2 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/flawfinder/
RUN pip3 install --trusted-host files.pythonhosted.org flawfinder==2.0.19
