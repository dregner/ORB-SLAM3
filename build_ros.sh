echo "Building ROS nodes"

cd Examples_old/ROS/ORB_SLAM3
mkdir -p build
cd build
cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .. -DROS_BUILD_TYPE=Release
make -j
