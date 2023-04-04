cmake_minimum_required(VERSION 3.14)

if (TARGET ulBuildEnv)
    return ()
endif ()

include(FetchContent)

FetchContent_Declare(mb-util
        GIT_REPOSITORY https://github.com/devmarkusb/util
        GIT_TAG origin/HEAD
        GIT_SHALLOW ON
        )

FetchContent_MakeAvailable(mb-util)
