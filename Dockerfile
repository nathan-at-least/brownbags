FROM debian:stable

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
        git \
        python3-pip

RUN pip3 install git+https://github.com/nyergler/hieroglyph#egg=hieroglyph
WORKDIR /project
CMD make slides
