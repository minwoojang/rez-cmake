# Based and improved from https://github.com/piratecrew/rez-cmake

name = "cmake"

version = "3.15.3"

authors = [
    "Andy Cedilnik",
    "Bill Hoffman",
    "Brad King",
    "Ken Martin",
    "Alexander Neundorf"
]

description = \
    """
    CMake is a cross-platform free and open-source software tool for managing the build process
    of software using a compiler-independent method.
    """

requires = [
    "gcc-6"
]

variants = [
    ["platform-linux"]
]

tools = [
    "cmake"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "cmake-3.15.3"

def commands():
    env.PATH.prepend("{root}/bin")
