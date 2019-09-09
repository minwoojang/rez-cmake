CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(cmake_version 3.15.3)
set(cmake_short_version 3.15)

# CMake
rez_set_archive(
    url_cmake cmake/cmake-${cmake_version}.tar.gz
    $ENV{REZ_REPO_PAYLOAD_DIR}/cmake/cmake-${cmake_version}.tar.gz
)

ExternalProject_add(
    build_cmake
    URL ${url_cmake}
    PREFIX cmake
    CONFIGURE_COMMAND ./configure --prefix=${CMAKE_INSTALL_PREFIX}
    BUILD_COMMAND make -j$ENV{REZ_BUILD_THREAD_COUNT} VERBOSE=1
    INSTALL_COMMAND make install VERBOSE=1
    BUILD_IN_SOURCE 1
    ALWAYS 1
)

install(
    CODE
    "execute_process(
        COMMAND echo \"\n=== CMAKE BUILD FINISHED! ===\n\"
    )"
)
