#!/usr/bin/bash

extract_path=$1
install_path=$2
cmake_version=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${extract_path}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${install_path}"
echo -e "[CONFIGURE][ARGS] CMAKE VERSION: ${cmake_version}"

cd ${extract_path}

# We run the configuration script of CMake
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from CMake-${cmake_version}..."
echo -e "\n"

if [ -d build ]; then
    cd build
else
    mkdir build
    cd build

    ../configure --prefix=${install_path}
fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring CMake-${cmake_version}!"
echo -e "\n"
