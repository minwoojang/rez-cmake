#!/usr/bin/bash

build_path=$1
cmake_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] CMAKE VERSION: ${cmake_version}"

cd $build_path

# We finally install CMake
echo -e "\n"
echo -e "[INSTALL] Installing CMake-${cmake_version}..."
echo -e "\n"

make -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing CMake-${cmake_version}!"
echo -e "\n"
