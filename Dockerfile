FROM ros:melodic-ros-core

WORKDIR /home/

RUN apt-get update &&\
    apt-get install -y \
    build-essential \
    python-catkin-tools \
    python-rosdep

RUN mkdir -p catkin_ws/src

COPY ./ catkin_ws/src/red_handy_rov

WORKDIR /home/catkin_ws/

RUN \
    rosdep init &&\
    rosdep update &&\
    rosdep install --from-paths ./src --ignore-packages-from-source --rosdistro melodic -y

CMD ["/bin/bash"]