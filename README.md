# qt_qml_extensions library

[![build](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/build.yml/badge.svg)](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/build.yml)

To provide more uniform usage, style, defaults and control of
qml elements.

## Usage and start of the qt_qml_extensions_testapp

Set environment variables:
* `dev_qt_base` where Qt versions can be found in subdirs like `5.9.1`.

Set CMake variables:
* `UL_QT5_VERSION` to e.g. `5.9.1`
* `UL_QT_COMPILER_SUBDIR` to e.g. `gcc_64`

## Quick guide

    1 For an up-to-date usage blueprint please refer to the AppWindow.qml of testapp.
        You might especially just copy and paste the Ext... declarations block at the
        beginning to get started.
    2 Remember to keep your qml.qrc file complete.
    3 Controls usage
        import controls // and
        import controls/<style>
        in order to access the desired custom controls by appending an underscore '_'
        to any of the known built-in controls. (Of course don't mix different <style>'s
        in one app.)
        Built-in controls can be used in parallel (without a trailing '_'), but you should
        make clear, whether you use the Controls 1 or 2 version. E.g. it is good practice
        to write
            import QtQuick.Controls 1.5 as QC1
            import QtQuick.Controls 2.1 as QC1
        in order to write e.g. QC1.Button instead of Button.

## Implementation notes

    1 Controls
        Please note that only the 'minimal' style is always in up-to-date shape. If you want
        to use QC1_def or QC2_def you might first need to repair these according to 'minimal'
        or add the desired components first. Of course the idea is still, that QC2_def (and
        QC1_def as long as it is not considered deprecated) contains common stuff and styles are
        build based on that.

## Contributing

### todos

1. Qt 5.9.9 works, but Qt 5.15.2 is broken, lots of error logs also...