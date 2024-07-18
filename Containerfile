FROM ubuntu:22.04

LABEL org.opencontainers.image.authors="Rob Riggs <rob@mobilinkd.com>"

ENV TZ=Etc/UTC

COPY driver/st-stlink-udev-rules-1.0.3-2-linux-all.deb stm32cubemonitor_1.8.0_amd64.deb .

RUN apt-get update && \
    apt-get clean && \ 
    apt-get install -y \
        build-essential \
        wget \
        curl \
        libncurses5

RUN echo "A" | apt-get -y -f install ./stm32cubemonitor_1.8.0_amd64.deb

ENV LICENSE_ALREADY_ACCEPTED=1

RUN apt-get -y -f install  ./st-stlink-udev-rules-1.0.3-2-linux-all.deb

RUN rm -f ./stm32cubemonitor_1.8.0_amd64.deb ./st-stlink-udev-rules-1.0.3-2-linux-all.deb

RUN mkdir /work

WORKDIR /work

CMD ["/usr/bin/stm32cubemonitor", "--no-sandbox"]

