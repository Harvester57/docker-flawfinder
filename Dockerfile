FROM python:3.9.5-alpine3.13

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "06-05-2021"
LABEL author "Florian Stosse"
LABEL description "FlawFinder v2.0.15, built using Python v3.9 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/flawfinder/
RUN pip3 install flawfinder==2.0.15