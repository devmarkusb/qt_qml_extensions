include_guard(GLOBAL)

if(NOT TARGET mb::util)
    find_package(mb.util CONFIG REQUIRED)
endif()

if(NOT COMMAND mb_ul_include)
    message(
        FATAL_ERROR
        "mb.util is required to provide mb_ul_include via cmake-util.cmake."
    )
endif()
