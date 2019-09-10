#!/usr/bin/bash

build_path=$1
cmake_version=$2

# We print the arguments passed to the Bash script
echo -e "\n============="
echo -e "=== BUILD ==="
echo -e "=============\n"

echo -e "BUILD PATH: ${build_path}\n"
echo -e "CMAKE VERSION: ${cmake_version}"

cd $build_path

# We build CMake
echo -e "Building CMake-${cmake_version}...\n"

make -j${REZ_BUILD_THREAD_COUNT}

echo -e "\nFinished building CMake-${cmake_version}!\n"
