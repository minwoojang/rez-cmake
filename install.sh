#!/usr/bin/bash

build_path=$1
cmake_version=$2

# We print the arguments passed to the Bash script
echo -e "\n==============="
echo -e "=== INSTALL ==="
echo -e "===============\n"

echo -e "BUILD PATH: ${build_path}"
echo -e "CMAKE VERSION: ${cmake_version}"

cd $build_path

# We finally install CMake
echo -e "\nInstalling CMake-${cmake_version}...\n"

make install

echo -e "\nFinished installing CMake-${cmake_version}!\n"
