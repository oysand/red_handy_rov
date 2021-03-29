#!/bin/bash

source /opt/ros/melodic/setup.bash

catkin build

source /home/catkin_ws/devel/setup.bash

roscore
