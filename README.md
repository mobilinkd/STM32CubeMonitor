# STM32CubeMonitor in a Container

This repo builds a container for STM32CubeMonitor, ST Micro's tool for
real-time monitoring of STM32 embedded systems.

This container is needed by anyone runnin non-Ubuntu based systems, or any
Ubuntu LTS newer than 22.04, as STM32CubeMonitor for Linux is currently only
distributed as deb packages for Ubuntu 22.04.

It is hoped that this will not be needed for long, that STM will package
the software properly for use on a wider variety of Linux systems.

# Prerequisites

This was developed on Fedora 39 and expects `podman` to be available for
building and running the container.

You will need a user account on st.com to download the software.

You will need to download the software from:

https://www.st.com/en/development-tools/stm32cubemonitor.html

# Building the Container

Manually download the STM32CubeMonitor package from st.com. You will need
an account and be signed in for this. You will download a package called
`en.stm32cubemon-lin-v-1-8-0.zip`.

Unzip the file into the current directory. This will create a number of
files, but we only care about the two .deb files that are extracted.

Build the container using podman.

    podman build -t mobilinkd/stm32cubemon .

# Running STM32CubeMonitor

A script to start the application in the container is available called
`STM32CubeMonitor.sh`.

    $ STM32CubeMonitor.sh {ProjectDir}

The `{ProjectDir}` is expected to be the directory where the firmware
development occurs, and it needs to have a valid ARM ELF file available.

If it is not specified, the current directory is used.

