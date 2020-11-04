FROM python:3.8-alpine

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "16-04-2020"
LABEL author "Florian Stosse"
LABEL description "FlawFinder v2.0.11, built using Python v3.8 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/flawfinder/
RUN pip3 install flawfinder==2.0.11
