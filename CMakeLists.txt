cmake_minimum_required(VERSION 3.16)

project(qt_qml_extensions LANGUAGES CXX)

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

ul_include(qt.cmake)
find_package(Qt6 REQUIRED COMPONENTS Core Core5Compat Gui Quick QuickControls2 Svg)
qt_standard_project_setup(REQUIRES 6.8)

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

set(target_IMPL_SOURCES
    testapp/src/_gui/src_Qt/cfg_model.h
    testapp/src/_gui/src_Qt/main.cpp
)

set(target_input
    ${WIN32_ON_OFF_SWITCH}
    MACOSX_BUNDLE
    ${target_UWP_ASSETS}
    ${target_RESOURCES}
    ${target_IMPL_SOURCES}
)

set(target_QML_DIR ${CMAKE_CURRENT_LIST_DIR})

qt_add_executable(${target} ${target_input})

qt_add_qml_module(${target}
    URI ${target}
    NO_RESOURCE_TARGET_PATH
    QML_FILES
        "_shared/CustomScaler.qml"
        "colors_palette/ExtColors.qml"
        "colors_palette/ExtColorsTest.qml"
        "colors_palette/impl/ColorsActive.qml"
        "colors_palette/impl/ColorsDisabled.qml"
        "colors_palette/impl/ColorsInactive.qml"
        "colors_palette/impl/TestRectangle.qml"
        "colors_palette/schemes/Bright.qml"
        "colors_palette/schemes/Dark.qml"
        "colors_palette/schemes/Def.qml"
        "colors_palette/schemes/Inverse.qml"
        "colors_palette/schemes/PurpleGreen.qml"
        "controls/_shared/impl/CfgControls.qml"
        "controls/_shared/impl/obtainButtonProps.js"
        "controls/_shared/impl/obtainControlProps.js"
        "controls/_shared/impl/obtainListDelegateProps.js"
        "controls/ControlsTest.qml"
        "controls/ExtControlsCfg.qml"
        "controls/minimal/ApplicationWindow_.qml"
        "controls/minimal/Button_.qml"
        "controls/minimal/ButtonTool_.qml"
        "controls/minimal/ButtonWithIcon_.qml"
        "controls/minimal/CharColorSwitch_.qml"
        "controls/minimal/CheckBox_.qml"
        "controls/minimal/ComboBox_.qml"
        "controls/minimal/Drawer_.qml"
        "controls/minimal/Frame_.qml"
        "controls/minimal/GroupBox_.qml"
        "controls/minimal/impl/ButtonBackground.qml"
        "controls/minimal/impl/FrameBackground.qml"
        "controls/minimal/impl/PaneBackground.qml"
        "controls/minimal/impl/TextFieldBackground.qml"
        "controls/minimal/Label_.qml"
        "controls/minimal/ListBox_.qml"
        "controls/minimal/Pane_.qml"
        "controls/minimal/Popup_.qml"
        "controls/minimal/RadioButton_.qml"
        "controls/minimal/ScrollBar_.qml"
        "controls/minimal/ShortcutLabel_.qml"
        "controls/minimal/Spacer_Col_.qml"
        "controls/minimal/Spacer_Row_.qml"
        "controls/minimal/SpinBox_.qml"
        "controls/minimal/SpinBoxLabelRow_.qml"
        "controls/minimal/TabBar_.qml"
        "controls/minimal/TabButton_.qml"
        "controls/minimal/TextArea_.qml"
        "controls/minimal/TextAreaScrollable_.qml"
        "controls/minimal/TextField_.qml"
        "controls/minimal/TextFieldBrowseBtnRow_.qml"
        "controls/minimal/TextFieldWithLabel_.qml"
        "controls/minimal/TextInput_.qml"
        "controls/minimal/ToolTip_.qml"
        "controls/TestHelperBox.qml"
        "controls/TestHelperCornerMarkers.qml"
        "core/noop.js"
        "core/os.js"
        "fonts/ExtFont.qml"
        "fonts/ExtFontMetrics.qml"
        "fonts/ExtFontTest.qml"
        "fonts/impl/TestRectangle.qml"
        "fonts/schemes/Def.qml"
        "fonts/schemes/DefQC2.qml"
        "fonts/schemes/Mistral.qml"
        "layout/ExtLayoutTest.qml"
        "layout/ExtScale.qml"
        "layout/ExtSpacing.qml"
        "layout/impl/TestHelperObj.qml"
        "layout/impl/TestRectangle.qml"
        "testapp/gui/AppWindow.qml"
        "testapp/gui/Draft.qml"
        "testapp/gui/dummydata/cfgModel.qml"
    RESOURCES
        "colors_palette/impl/qmldir"
        "controls/_shared/impl/checkmark.png"
        "controls/_shared/impl/delete_cross.svg"
        "controls/_shared/impl/open.png"
        "controls/menu.svg"
        "controls/spheres.svg"
)

ul_include(qt_deploy.cmake)
ul_qt_deploy(${target} ${target_QML_DIR})

configure_file(testapp_build_config.h.in ${CMAKE_BINARY_DIR}/testapp_build_config.h)
target_include_directories(${target} PUBLIC ${CMAKE_BINARY_DIR})

target_include_directories(${target} PUBLIC src)

target_link_libraries(${target} PUBLIC mb-util Qt::Core Qt::Core5Compat Qt::Gui Qt::Quick Qt::QuickControls2 Qt::Svg)

ul_set_target_defaults(${target})

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    target_compile_options(${target} PRIVATE -Wno-missing-prototypes)
endif()

if (UNIX AND NOT APPLE AND CMAKE_CROSSCOMPILING)
    find_package(Qt6 REQUIRED COMPONENTS QuickTemplates2)

    # Work around QTBUG-86533
    target_link_libraries(${target} PRIVATE Qt6::QuickTemplates2)
endif()

install(TARGETS ${target}
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET ${target}
    OUTPUT_SCRIPT deploy_script
    MACOS_BUNDLE_POST_BUILD
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${deploy_script})
