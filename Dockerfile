<<<<<<< HEAD
# our base image
FROM ubuntu18.04-for-brainflayer

# Set Term
ENV TERM linux \
        DEBIAN_FRONTEND noninteractive \
CMD ["/bin/bash"]

# Create New User - Vermil
RUN useradd -rm --password Password123 -d /home/brainflayer -s /bin/bash -g root -G sudo -u 1000 brainflayer
USER brainflayer
WORKDIR /home/brainflayer

# Clone My Git Repository, Autoconfig, Make, Install, Add SSH, Cleanup
RUN cd /home/brainflayer \
        && git clone https://github.com/mpossengineer/brainflayer \
        && cd ./brainflayer \
        && make all
~                         
||||||| parent of 7274bca (Add Dockerfile)
=======
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    ca-certificates \
    automake \
    libtool \
    libssl-dev \
    libgmp3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ryancdotorg/brainflayer.git
RUN cd brainflayer && make
ENTRYPOINT ["/brainflayer/brainflayer"]
>>>>>>> 7274bca (Add Dockerfile)
