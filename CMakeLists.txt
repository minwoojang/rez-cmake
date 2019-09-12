CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(cmake_version 3.15.3)

# CMake
rez_set_archive(
    cmake_url cmake/cmake-${cmake_version}.tar.gz
    https://github.com/Kitware/CMake/releases/download/v3.15.3/cmake-3.15.3.tar.gz
)

# The environment variable REZ_TMP_PATH is meant to point to a location such as "/tmp/rez".
set(EXTRACT_DIR $ENV{REZ_TMP_PATH}/cmake/${cmake_version})
set(BUILD_DIR ${EXTRACT_DIR}/build)

# We configure/build/install CMake through the ExternalProject_Add macro,
# using three different shell scripts for each of these steps.
# If necessary, it is possible to skip one of these steps by replacing the command
# by "", an empty string.
ExternalProject_Add(
    build_cmake
    URL ${cmake_url}
    PREFIX cmake
    SOURCE_DIR ${EXTRACT_DIR}
    CONFIGURE_COMMAND bash ${CMAKE_SOURCE_DIR}/configure.sh ${EXTRACT_DIR} ${CMAKE_INSTALL_PREFIX} ${cmake_version}
    BUILD_COMMAND bash ${CMAKE_SOURCE_DIR}/build.sh ${BUILD_DIR} ${cmake_version}
    INSTALL_COMMAND bash ${CMAKE_SOURCE_DIR}/install.sh ${BUILD_DIR} ${cmake_version}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] CMake-${cmake_version} PACKAGE SETUP FINISHED!\n\"
    )"
)
