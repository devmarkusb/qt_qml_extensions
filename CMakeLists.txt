cmake_minimum_required(VERSION 3.5)

project(qt_qml_extensions)

include(${CMAKE_CURRENT_LIST_DIR}/cmake_util/util.cmake)

include(${ul_CMAKE_DIRS}/cmake_util.cmake)

ul_include(buildnr.cmake)
project(qt_qml_extensions_testapp VERSION 0.1.${BUILD_NR}.0)
message(STATUS "${PROJECT_NAME} version: " ${PROJECT_VERSION})
set(target ${PROJECT_NAME})

ul_include(defaults.cmake)

set(UL_ADDITIONAL_CLANG_FORMAT_DIRS "testapp" CACHE STRING "" FORCE)
ul_include(clang-format.cmake)
ul_include(githooks.cmake)

option(UL_FORCE_TESTAPP "switch on if you intent to build the testapp (especially needed for standalone build under UWP)" OFF)
# Not exactly a unit test, but some kind of test host.
if (NOT UL_BUILD_UNITTESTS AND NOT ${UL_FORCE_TESTAPP})
    return ()
endif ()

ul_include(qt5.cmake)
find_package(Qt5 COMPONENTS Quick QuickControls2 Svg)

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

qt5_add_resources(target_RESOURCES qml.qrc)

set(target_IMPL_SOURCES
    testapp/src/_gui/src_Qt/cfg_model.h
    testapp/src/_gui/src_Qt/main.cpp
)

set(target_input
    ${WIN32_ON_OFF_SWITCH}
    ${target_UWP_ASSETS}
    ${target_RESOURCES}
    ${target_IMPL_SOURCES}
)

set(target_QML_DIR ${CMAKE_CURRENT_LIST_DIR})

if (ANDROID)
    add_library(${target} SHARED ${target_input})
else ()
    add_executable(${target} ${target_input})
endif ()

ul_include(qt_deploy.cmake)
ul_qt_deploy(${target} ${target_QML_DIR})

configure_file(testapp_build_config.h.in ${CMAKE_BINARY_DIR}/testapp_build_config.h)
target_include_directories(${target} PUBLIC ${CMAKE_BINARY_DIR})

target_include_directories(${target} PUBLIC src)
target_include_directories(${target} SYSTEM PUBLIC ${ul_INCLUDE_DIRS})

target_link_libraries(${target} PUBLIC mb-util Qt::Quick Qt::QuickControls2 Qt::Svg)

ul_set_target_defaults(${target})

set_property(SOURCE qrc_qml.cpp PROPERTY SKIP_AUTOMOC ON)

if (ANDROID)
    include(${UL_CMAKE_UTIL_DIR}/qt-android-cmake.cmake)
    string(TOLOWER ${target} targetLowerCase)
    add_qt_android_apk(${target}_apk ${target}
            VERSION_CODE 1
            # uncomment the following two lines for a signed release build apk
            # *and* increment VERSION_CODE above
            KEYSTORE ${UL_ANDROID_SIGN_KEY_PATH} key
            KEYSTORE_PASSWORD ${UL_ANDROID_SIGN_KEY_PASS}
            NAME ${target}
            PACKAGE_SOURCES ${UL_CMAKE_UTIL_DIR}/android
            PACKAGE_NAME "org.enterprise.${targetLowerCase}"
            BUILDTOOLS_REVISION "28.0.3")
endif ()
