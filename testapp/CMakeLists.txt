# Some notes for the occasional CMake user.
#
# 1 Debug or Release or...
# start cmake with arg either
# -DCMAKE_BUILD_TYPE=Debug
# or
# -DCMAKE_BUILD_TYPE=Release
# Other options are: MinSizeRel, RelWithDebInfo
#
# 2 Dynamic vs Static C/C++ runtime lib
# There is no support for static runtime libs! You could achieve this
# for MSVC, but this is not recommended. You or other will end up in
# conflicts soon.

cmake_minimum_required(VERSION 3.4.1)

include(${CMAKE_CURRENT_LIST_DIR}/cmake_util/util.cmake)

include(${ul_CMAKE_DIRS}/cmake_util.cmake)

ul_include(buildnr.cmake)
project(qt_qml_extensions_testapp VERSION 0.1.${BUILD_NR}.0)
message(STATUS "project version: " ${PROJECT_VERSION})
set(target ${PROJECT_NAME})

ul_include(defaults.cmake)

ul_include(fetch-clangformat-repo.cmake)
ul_include(clang-format.cmake)
ul_include(githooks.cmake)

option(UL_FORCE_TESTAPP "switch on if you intent to build the testapp (especially needed for standalone build under UWP)" OFF)
# Not exactly a unit test, but some kind of test host.
if (NOT UL_BUILD_UNITTESTS AND NOT ${UL_FORCE_TESTAPP})
    return ()
endif ()

ul_include(qt.cmake)
find_package(Qt5 COMPONENTS Quick)


################################################################################################

# only purpose of this so far: prevent msvc from showing an additional console window in Qt apps
if (UL_DEPLOYMENT_BUILD AND WIN32 OR "${UL_DEPLOY_TARGET}" STREQUAL "uwp")
    set(WIN32_ON_OFF_SWITCH "WIN32")
else ()
    set(WIN32_ON_OFF_SWITCH "")
endif ()

ul_include(uwp_tools.cmake)
ul_obtain_UWP_resources(
    "testapp"
    "MB"
    "testapp"
    ""
    ""
    ""
    "${PROJECT_VERSION}"
    "${UL_CMAKE_INC_UWP_TOOLS_DEF_ICO}"
    "#336699"
    ""
    target_UWP_ASSETS)

qt5_add_resources(target_RESOURCES ../qml.qrc)

add_executable(${target}
    ${WIN32_ON_OFF_SWITCH}
    src/_gui/src_Qt/cfg_model.h
    src/_gui/src_Qt/main.cpp
    ${target_RESOURCES}
    ${target_UWP_ASSETS}
)

ul_include(qt_deploy.cmake)
ul_qt_deploy(${target} ${CMAKE_CURRENT_LIST_DIR}/..)

configure_file(testapp_build_config.h.in ${CMAKE_BINARY_DIR}/testapp_build_config.h)
target_include_directories(${target} PUBLIC ${CMAKE_BINARY_DIR})

target_include_directories(${target} PUBLIC src)
target_include_directories(${target} SYSTEM PUBLIC ${Qt5Quick_INCLUDE_DIRS})
target_include_directories(${target} SYSTEM PUBLIC ${ul_INCLUDE_DIRS})

target_link_libraries(${target} PUBLIC Qt5::Quick)

ul_set_target_defaults(${target})

set_property(SOURCE qrc_qml.cpp PROPERTY SKIP_AUTOMOC ON)
