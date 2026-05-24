# qt_qml_extensions library

[![build](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/build.yml/badge.svg)](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/build.yml)

To provide more uniform usage, style, defaults and control of
qml elements.

## Usage and start of the qt_qml_extensions_testapp

Initialize submodules after cloning:

```sh
git submodule update --init --recursive --recommend-shallow
```

With `devenv` initialized, preset builds are available for common GCC, Clang,
and AppleClang debug/release configurations:

```sh
cmake --preset gcc-debug
cmake --build --preset gcc-debug
ctest --preset gcc-debug
```

The presets and direct top-level CMake configure use `fetchcontent-lockfile.json`
to provide `mb.util` and the pre-commit helper modules when CMake 3.24+ is used.

Qt is provided to CMake through `CMAKE_PREFIX_PATH`. This is the intended way to
point `find_package(Qt6 ...)` at a local Qt installation while keeping
machine-specific paths out of the shared presets. Put the value in your ignored
`CMakeUserPresets.json`, or pass it on the command line. CMake requires preset
names to be unique across `CMakePresets.json` and `CMakeUserPresets.json`, so
local presets use a `local-` prefix instead of replacing the shared names:

```sh
cmake --preset local-gcc-debug
```

```sh
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=/path/to/Qt/6.9.3/macos
```

The test app and preset flow were most recently tested with Qt 6.9.3.

The direct CMake invocation used by CI is still supported:

```sh
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_STANDARD=26
cmake --build build --config Debug
ctest --test-dir build -C Debug --output-on-failure
```

## Quick guide

1. For an up-to-date usage blueprint please refer to the AppWindow.qml of testapp.
   You might especially just copy and paste the Ext... declarations block at the
   beginning to get started.
2. Remember to keep your qml.qrc file complete.
3. Controls usage
   ```
   import controls // and
   import controls/<style>
   ```
   in order to access the desired custom controls by appending an underscore `_`
   to any of the known built-in controls. (Of course don't mix different `<style>`s
   in one app.) Built-in controls can be used in parallel (without a trailing `_`), but you should
   make clear, whether you use the Controls 1 or 2 version. E.g. it is good practice
   to write
   ```
   import QtQuick.Controls 2.2 as QC2
   ```
   in order to write e.g. QC2.Button instead of Button.

## Implementation notes

### Controls
Please note that only the 'minimal' style is always in up-to-date shape. If you want
to use QC1_def or QC2_def you might first need to repair these according to 'minimal'
or add the desired components first. Of course the idea is still, that QC2_def (and
QC1_def as long as it is not considered deprecated) contains common stuff and styles are
build based on that.

## Contributing

The test app targets Qt 6 and was most recently tested with Qt 6.9.3. Android
builds additionally need a matching combination of Java, NDK, and signing setup;
example configuration see `cmake-android.sh`.

### todos
