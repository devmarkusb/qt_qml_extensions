cmake_minimum_required(VERSION 3.24...4.3)

# Tier-A lockfile wiring for IDE/direct configures that do not use CMakePresets.
# Presets set CMAKE_PROJECT_TOP_LEVEL_INCLUDES in cache; avoid duplicating the hook.
set(_mb_qt_qml_extensions_fc_lockfile
    "${CMAKE_CURRENT_LIST_DIR}/devenv/cmake/fetch-content-from-lockfile.cmake"
)
set(_mb_qt_qml_extensions_fc_configured FALSE)
foreach(_mb_qt_qml_extensions_fc_inc IN LISTS CMAKE_PROJECT_TOP_LEVEL_INCLUDES)
    if(
        _mb_qt_qml_extensions_fc_inc
            MATCHES
            "fetch-content-from-lockfile\\.cmake$"
    )
        set(_mb_qt_qml_extensions_fc_configured TRUE)
        break()
    endif()
endforeach()
if(NOT _mb_qt_qml_extensions_fc_configured)
    list(
        APPEND CMAKE_PROJECT_TOP_LEVEL_INCLUDES
        "${_mb_qt_qml_extensions_fc_lockfile}"
    )
endif()
if(NOT MB_DEVENV_ROOT)
    set(MB_DEVENV_ROOT
        "${CMAKE_CURRENT_LIST_DIR}"
        CACHE PATH
        "Consumer project root (directory containing fetchcontent-lockfile.json)."
    )
endif()

project(
    mb.qt-qml-extensions
    DESCRIPTION "Qt/QML extension components"
    LANGUAGES CXX
    VERSION 0.1.0
)

option(
    MB_QT_QML_EXTENSIONS_BUILD_TESTAPP
    "Enable building the test application. Default: ${PROJECT_IS_TOP_LEVEL}. Values: { ON, OFF }."
    ${PROJECT_IS_TOP_LEVEL}
)

add_subdirectory(devenv)
list(PREPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/devenv/cmake")

if(MB_QT_QML_EXTENSIONS_BUILD_TESTAPP)
    include(mb-devenv-ctest-root)
endif()
include(mb-devenv-defaults)

include(cmake/dependencies.cmake)

# From fetched https://github.com/devmarkusb/pre-commit (see fetchcontent-lockfile.json).
mb_pre_commit_setup_project(PRE_COMMIT_INSTALL_EXAMPLE_CONFIG OFF)

if(NOT MB_QT_QML_EXTENSIONS_BUILD_TESTAPP)
    return()
endif()

project(mb.qt_qml_extensions_testapp VERSION ${PROJECT_VERSION})
message(STATUS "${PROJECT_NAME} version: " ${PROJECT_VERSION})
set(_mb_qt_qml_extensions_testapp_target ${PROJECT_NAME})

include(GNUInstallDirs)

mb_ul_include(qt.cmake)
find_package(
    Qt6
    REQUIRED
    COMPONENTS Core Core5Compat Gui Quick QuickControls2 Svg
)
qt_standard_project_setup(REQUIRES 6.8)

# only purpose of this so far: prevent msvc from showing an additional console window in Qt apps
if(
    (MB_UL_DEPLOYMENT_BUILD AND WIN32)
    OR "${MB_UL_DEPLOY_TARGET}" STREQUAL "uwp"
)
    set(_mb_qt_qml_extensions_testapp_win32_arg "WIN32")
else()
    set(_mb_qt_qml_extensions_testapp_win32_arg "")
endif()

mb_ul_include(uwp-tools.cmake)
mb_ul_obtain_uwp_resources(
    "testapp"
    "MB"
    "testapp"
    ""
    ""
    ""
    "${PROJECT_VERSION}"
    "${MB_UL_CMAKE_INC_UWP_TOOLS_DEF_ICO}"
    "#336699"
    ""
    _mb_qt_qml_extensions_testapp_uwp_assets
)

set(_mb_qt_qml_extensions_testapp_impl_sources
    testapp/src/_gui/src_Qt/cfg_model.hpp
    testapp/src/_gui/src_Qt/main.cpp
)

set(_mb_qt_qml_extensions_testapp_input
    ${_mb_qt_qml_extensions_testapp_win32_arg}
    MACOSX_BUNDLE
    ${_mb_qt_qml_extensions_testapp_uwp_assets}
    ${_mb_qt_qml_extensions_testapp_impl_sources}
)

set(_mb_qt_qml_extensions_testapp_qml_dir ${CMAKE_CURRENT_LIST_DIR})

qt_add_executable(
    ${_mb_qt_qml_extensions_testapp_target}
    ${_mb_qt_qml_extensions_testapp_input}
)

set_target_properties(
    ${_mb_qt_qml_extensions_testapp_target}
    PROPERTIES CXX_EXTENSIONS OFF CXX_STANDARD 23 CXX_STANDARD_REQUIRED ON
)
if(ANDROID)
    if(NOT QT_ANDROID_COMPILE_SDK_VERSION AND QT_ANDROID_TARGET_SDK_VERSION)
        set(QT_ANDROID_COMPILE_SDK_VERSION "${QT_ANDROID_TARGET_SDK_VERSION}")
    endif()
    if(NOT QT_ANDROID_PACKAGE_SOURCE_DIR)
        set(QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/android")
    endif()

    set(_mb_qt_qml_extensions_testapp_android_properties)
    foreach(
        _mb_qt_qml_extensions_testapp_android_property
        QT_ANDROID_COMPILE_SDK_VERSION
        QT_ANDROID_MIN_SDK_VERSION
        QT_ANDROID_PACKAGE_NAME
        QT_ANDROID_PACKAGE_SOURCE_DIR
        QT_ANDROID_SDK_BUILD_TOOLS_REVISION
        QT_ANDROID_TARGET_SDK_VERSION
        QT_ANDROID_VERSION_CODE
        QT_ANDROID_VERSION_NAME
    )
        if(DEFINED ${_mb_qt_qml_extensions_testapp_android_property})
            if(
                NOT "${${_mb_qt_qml_extensions_testapp_android_property}}"
                    STREQUAL
                    ""
            )
                list(
                    APPEND _mb_qt_qml_extensions_testapp_android_properties
                    "${_mb_qt_qml_extensions_testapp_android_property}"
                    "${${_mb_qt_qml_extensions_testapp_android_property}}"
                )
            endif()
        endif()
    endforeach()

    if(_mb_qt_qml_extensions_testapp_android_properties)
        set_target_properties(
            ${_mb_qt_qml_extensions_testapp_target}
            PROPERTIES ${_mb_qt_qml_extensions_testapp_android_properties}
        )
    endif()
endif()
target_compile_features(
    ${_mb_qt_qml_extensions_testapp_target}
    PUBLIC cxx_std_23
)

mb_devenv_set_target_defaults(${_mb_qt_qml_extensions_testapp_target})

# qt_add_qml_module creates a same-named subdirectory under the build tree for QML artifacts.
set_target_properties(
    ${_mb_qt_qml_extensions_testapp_target}
    PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
)

function(_mb_qt_qml_extensions_relax_generated_source_warnings target)
    set(_mb_qt_qml_extensions_generated_source_options
        "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-Wno-missing-prototypes>"
        "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-Wno-extra-semi-stmt>"
        "$<$<COMPILE_LANG_AND_ID:CXX,Clang,AppleClang>:-Wno-float-equal>"
    )

    get_target_property(_mb_qt_qml_extensions_sources ${target} SOURCES)
    if(NOT _mb_qt_qml_extensions_sources)
        return()
    endif()

    foreach(_mb_qt_qml_extensions_source IN LISTS _mb_qt_qml_extensions_sources)
        get_source_file_property(
            _mb_qt_qml_extensions_is_generated
            "${_mb_qt_qml_extensions_source}"
            TARGET_DIRECTORY ${target}
            GENERATED
        )

        if(_mb_qt_qml_extensions_is_generated)
            set_property(
                SOURCE
                    "${_mb_qt_qml_extensions_source}"
                    TARGET_DIRECTORY
                    ${target}
                APPEND
                PROPERTY
                    COMPILE_OPTIONS
                        ${_mb_qt_qml_extensions_generated_source_options}
            )
        endif()
    endforeach()
endfunction()

qt_add_qml_module(
    ${_mb_qt_qml_extensions_testapp_target}
    URI ${_mb_qt_qml_extensions_testapp_target}
    NO_RESOURCE_TARGET_PATH
    QML_FILES
        "_shared/CustomScaler.qml"
        "colors_palette/ExtColors.qml"
        "colors_palette/ExtColorsTest.qml"
        "colors_palette/impl/ColorsActive.qml"
        "colors_palette/impl/ColorsDisabled.qml"
        "colors_palette/impl/ColorsInactive.qml"
        "colors_palette/impl/TestLabel.qml"
        "colors_palette/impl/TestRectangle.qml"
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

cmake_language(
    DEFER
    CALL _mb_qt_qml_extensions_relax_generated_source_warnings
    ${_mb_qt_qml_extensions_testapp_target}
)

mb_ul_include(qt-deploy.cmake)
mb_ul_qt_deploy(
    ${_mb_qt_qml_extensions_testapp_target}
    ${_mb_qt_qml_extensions_testapp_qml_dir}
)

configure_file(
    testapp_build_config.hpp.in
    ${CMAKE_BINARY_DIR}/testapp_build_config.hpp
)
target_include_directories(
    ${_mb_qt_qml_extensions_testapp_target}
    PUBLIC ${CMAKE_BINARY_DIR}
)

target_link_libraries(
    ${_mb_qt_qml_extensions_testapp_target}
    PUBLIC
        mb::util
        Qt::Core
        Qt::Core5Compat
        Qt::Gui
        Qt::Quick
        Qt::QuickControls2
        Qt::Svg
)

target_compile_options(
    ${_mb_qt_qml_extensions_testapp_target}
    PRIVATE
        "$<$<COMPILE_LANG_AND_ID:CXX,AppleClang>:-Wno-poison-system-directories>"
)

if(UNIX AND NOT APPLE AND CMAKE_CROSSCOMPILING)
    find_package(Qt6 REQUIRED COMPONENTS QuickTemplates2)

    # Work around QTBUG-86533
    target_link_libraries(
        ${_mb_qt_qml_extensions_testapp_target}
        PRIVATE Qt6::QuickTemplates2
    )
endif()

install(
    TARGETS ${_mb_qt_qml_extensions_testapp_target}
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET ${_mb_qt_qml_extensions_testapp_target}
    OUTPUT_SCRIPT _mb_qt_qml_extensions_testapp_deploy_script
    MACOS_BUNDLE_POST_BUILD
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${_mb_qt_qml_extensions_testapp_deploy_script})
