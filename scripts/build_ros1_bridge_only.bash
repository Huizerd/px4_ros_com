#!/usr/bin/env bash
set -e

# from ros1_bridge README

# paths
ROS1_INSTALL_PATH=/opt/ros/noetic
ROS2_INSTALL_PATH=/opt/ros/foxy

# first source ROS1
source ${ROS1_INSTALL_PATH}/setup.bash

# then ROS2
source ${ROS2_INSTALL_PATH}/setup.bash

# then only build ros1_bridge
# limiting the number of processes to prevent memory problems
MAKEFLAGS=-j1 colcon build --cmake-args -DCMAKE_BUILD_TYPE=RELWITHDEBINFO --symlink-install --packages-select ros1_bridge --cmake-force-configure
