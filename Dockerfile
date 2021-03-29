FROM ros:melodic-ros-core

WORKDIR /home/

RUN apt-get update &&\
    apt-get install -y \
    build-essential \
    python-catkin-tools \
    python-rosdep \
    ros-melodic-uuv-simulator \
    git \
    vim

RUN mkdir -p catkin_ws/src

COPY ./ /home/catkin_ws/src/red_handy_rov

WORKDIR /home/catkin_ws/

RUN echo "source /opt/ros/melodic/setup.bash" >> /home/.bashrc

RUN \
    rosdep init &&\
    rosdep update &&\
    rosdep install --from-paths ./src --ignore-packages-from-source --rosdistro melodic -y

ENTRYPOINT /home/catkin_ws/src/red_handy_rov/entrypoint.sh
