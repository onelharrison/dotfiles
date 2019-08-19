#!/usr/bin/env sh

echo 'INIT: ROS setup initiated.'

# Accept software from packages.ros.org
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Install ROS
check_or_install ros-melodic-desktop-full

echo 'DONE: ROS setup completed.'
echo '--------'

