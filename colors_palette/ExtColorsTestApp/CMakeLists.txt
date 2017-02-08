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

include(buildnr.cmake)
project(ExtColorsTestApp VERSION 0.1.0.${BUILD_NR})
message(STATUS "project version: " ${PROJECT_VERSION})
set(TargetAppName "ExtColorsTestApp")

include(defaults.cmake)

file(GLOB_RECURSE TargetAppNameAsLibForTest_SRC_INCS "src/*.h*")

#if (NOT Qt5Quick_INCLUDE_DIRS)
    set(CMAKE_INCLUDE_CURRENT_DIR ON)
    set(CMAKE_AUTOMOC ON)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        set(QT_COMPILER_SUBDIR "$ENV{dev_mingw}")
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(QT_COMPILER_SUBDIR "$ENV{dev_msvc}")
    endif ()
    list(APPEND CMAKE_PREFIX_PATH "$ENV{dev_qt_base}/5.7/${QT_COMPILER_SUBDIR}")
    find_package(Qt5Quick) # Widgets contains a.o.t. Core and Gui
#endif ()

set(TargetAppNameAsLibForTest_SOURCES
)

set(TargetAppNameAsLibForTest "ExtColorsTestAppAsLibForTest")

add_library(${TargetAppNameAsLibForTest} STATIC
        ${TargetAppNameAsLibForTest_SOURCES}
        ${TargetAppNameAsLibForTest_SRC_INCS}
)

if (WIN32)
    set_property(TARGET ${TargetAppNameAsLibForTest} APPEND PROPERTY COMPILE_DEFINITIONS UNICODE _UNICODE)
endif ()

set_target_properties(${TargetAppNameAsLibForTest} PROPERTIES DEBUG_POSTFIX "d")

configure_file(${TargetAppName}_build_config.h.in ${CMAKE_BINARY_DIR}/${TargetAppName}_build_config.h)
target_include_directories(${TargetAppNameAsLibForTest} PUBLIC ${CMAKE_BINARY_DIR})

target_include_directories(${TargetAppNameAsLibForTest} PUBLIC .)
target_include_directories(${TargetAppNameAsLibForTest} PUBLIC src)
target_include_directories(${TargetAppNameAsLibForTest} SYSTEM PUBLIC ${Qt5Quick_INCLUDE_DIRS})

target_link_libraries(${TargetAppNameAsLibForTest} PUBLIC Qt5::Quick)

# only purpose of this so far: prevent msvc from showing an additional console window in Qt apps
if (WIN32)
    set(WIN32_ON_OFF_SWITCH "WIN32")
else ()
    set(WIN32_ON_OFF_SWITCH "")
endif ()

qt5_add_resources(TargetAppName_RESOURCES gui/qml.qrc)

add_executable(${TargetAppName}
    src/_gui/src_Qt/main.cpp
    ${TargetAppName_RESOURCES}
)

if (WIN32)
    set_property(TARGET ${TargetAppName} APPEND PROPERTY COMPILE_DEFINITIONS UNICODE _UNICODE)
endif ()

set_target_properties(${TargetAppName} PROPERTIES DEBUG_POSTFIX "d")

target_link_libraries(${TargetAppName} PRIVATE ${TargetAppNameAsLibForTest})



################################################################################################

set(TargetAppNameTest "ExtColorsTestAppTest")

set(TargetAppNameTest_SOURCES
    src/consts.test.cpp
)

add_executable(${TargetAppNameTest}
        ${TargetAppNameTest_SOURCES}
        ${TargetAppNameAsLibForTest_SRC_INCS}
)

if (WIN32)
    set_property(TARGET ${TargetAppNameTest} APPEND PROPERTY COMPILE_DEFINITIONS UNICODE _UNICODE)
endif ()

set_target_properties(${TargetAppNameTest} PROPERTIES DEBUG_POSTFIX "d")

set(GTEST_ROOT $ENV{dev_sdk_paths})
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${GTEST_ROOT})
set(GTEST_MSVC_SEARCH   MD)
find_package(GTest 1.7.0)

target_include_directories(${TargetAppNameTest} PRIVATE ${GTEST_INCLUDE_DIRS})

target_link_libraries(${TargetAppNameTest} PRIVATE ${GTEST_BOTH_LIBRARIES})
target_link_libraries(${TargetAppNameTest} PRIVATE ${TargetAppNameAsLibForTest})


add_custom_command(
  TARGET ${TargetAppNameTest} POST_BUILD
  COMMAND ${TargetAppNameTest}
)
