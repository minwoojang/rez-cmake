# Based and improved from https://github.com/piratecrew/rez-cmake

name = "cmake"

version = "3.27.7"

description = """
    CMake is a cross-platform free and open-source software tool for managing the build process
    of software using a compiler-independent method.
    """

authors = [
    "Andy Cedilnik",
    "Bill Hoffman",
    "Brad King",
    "Ken Martin",
    "Alexander Neundorf",
]

tools = [
    "cmake",
]

variants = [
    [
        "platform-linux",
        "arch-x86_64"
    ],
]

build_system = "cmake"


with scope("config") as config:
    config.build_thread_count = "logical_cores"


def commands():
    env.PATH.prepend("{root}/bin")

    # Helper environment variables.
    env.CMAKE_BINARY_PATH.set("{root}/bin")
