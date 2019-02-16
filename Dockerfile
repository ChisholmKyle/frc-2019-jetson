FROM ros:kinetic-perception-xenial

ENV DEBIAN_FRONTEND noninteractive

# prerequisites

RUN apt-get update && \
    apt-get install -y \
        apt-utils \
        ros-kinetic-web-video-server && \
    apt-get upgrade -y

# User to build software

ARG username=user
ENV user_name=$username

# Add user with sudo

RUN useradd -G sudo -m -s /bin/bash ${user_name}
RUN echo "${user_name} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# login as build user

USER $user_name
WORKDIR /home/$user_name
SHELL ["/bin/bash", "-c"]

# get sources

# RUN git clone https://github.com/Arctos6135/frc-2019-jetson.git
# WORKDIR /home/$user_name/frc-2019-jetson

# build package

# RUN wstool update -t src
# RUN source /opt/ros/kinetic/setup.bash && catkin_make

ENV DEBIAN_FRONTEND teletype
