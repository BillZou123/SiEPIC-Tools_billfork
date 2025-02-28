FROM quay.io/centos/centos:stream8

# Update the system and install necessary tools.
RUN dnf -y update && \
    dnf -y install wget bzip2 unzip git mesa-dri-drivers

# Install the newest version of KLayout
RUN wget https://www.klayout.org/downloads/CentOS_8/klayout-0.28.12-0.x86_64.rpm -O ~/klayout.rpm && \
    dnf -y localinstall ~/klayout.rpm && \
    rm ~/klayout.rpm

# Set the working directory
WORKDIR /home

# Set PATH
ENV PATH="/usr/local/bin:${PATH}"
ENV QT_QPA_PLATFORM=minimal
