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

include(${TOO_CMAKE_INC_BUILDNR})
project(TestApp VERSION 0.1.${BUILD_NR}.0)
message(STATUS "project version: " ${PROJECT_VERSION})
include(${TOO_CMAKE_INC_DEPLOYMENT_BUILD})
set(TargetAppName ${PROJECT_NAME})

include(${TOO_CMAKE_INC_DEFAULTS})

include(${TOO_CMAKE_INC_QT})
find_package(Qt5Quick)


################################################################################################

# only purpose of this so far: prevent msvc from showing an additional console window in Qt apps
if (DEPLOYMENT_BUILD AND WIN32 OR "${DEPLOY_TARGET}" STREQUAL "uwp")
    set(WIN32_ON_OFF_SWITCH "WIN32")
else ()
    set(WIN32_ON_OFF_SWITCH "")
endif ()

qt5_add_resources(TargetAppName_RESOURCES gui/qml.qrc)

add_executable(${TargetAppName}
    src/_gui/src_Qt/cfg_model.h
    src/_gui/src_Qt/main.cpp
    ${TargetAppName_RESOURCES}
)

if (WIN32)
    set_property(TARGET ${TargetAppName} APPEND PROPERTY COMPILE_DEFINITIONS UNICODE _UNICODE)
endif ()

set_target_properties(${TargetAppName} PROPERTIES DEBUG_POSTFIX "d")

configure_file(app_build_config.h.in ${CMAKE_BINARY_DIR}/app_build_config.h)
target_include_directories(${TargetAppName} PUBLIC ${CMAKE_BINARY_DIR})

target_include_directories(${TargetAppName} PUBLIC src)
target_include_directories(${TargetAppName} SYSTEM PUBLIC ${Qt5Quick_INCLUDE_DIRS})
target_include_directories(${TargetAppName} SYSTEM PUBLIC ${tooBuildEnv_INCLUDE_DIRS})

target_link_libraries(${TargetAppName} PUBLIC Qt5::Quick)
