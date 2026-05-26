# qt_qml_extensions library

[![build](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/build.yml/badge.svg)](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/build.yml)
[![android-release](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/android-release.yml/badge.svg)](https://github.com/devmarkusb/qt_qml_extensions/actions/workflows/android-release.yml)
[![License](https://img.shields.io/badge/license-Boost-blue.svg)](LICENSE)

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

## Android release builds

Android App Bundle builds are handled by
`.github/workflows/android-release.yml`. The workflow can be run manually, and
tags matching `android-v*` build and upload the signed bundle to the Google Play
`internal` track.

Manual workflow runs use `release_mode`:

- `build_only`: build and upload a signed AAB workflow artifact, but do not
  publish to Google Play.
- `publish_build`: build and upload the signed AAB to the selected Google Play
  track.
- `publish_build_and_store_entry`: publish the signed AAB and then update the
  Google Play store entry from `fastlane/metadata/android`.
- `update_store_entry_only`: update the Google Play store entry from
  `fastlane/metadata/android` without building an AAB, using a versionCode, or
  requiring Android signing secrets.

The store entry metadata is managed with Fastlane `supply`. Text files live in
`fastlane/metadata/android/<locale>/`, and store graphics/screenshots live in
`fastlane/metadata/android/<locale>/images/`. Image uploads replace the
corresponding current Play Store set, so keep the complete intended image set in
the repository before publishing store-entry changes.

Fastlane still requires an existing Play release versionCode when uploading
metadata. Store-entry modes automatically use the new build's `VERSION_CODE` when
one was built, or otherwise read the highest existing versionCode from the
selected Play track. If that track has no release, set `store_entry_version_code`
to any existing Play versionCode. This does not upload a new bundle or bump the
app version.

Configure these GitHub secrets before running a release:

- `ANDROID_UPLOAD_KEYSTORE_BASE64`: base64-encoded upload keystore. Required
  for AAB build modes.
- `ANDROID_KEYSTORE_ALIAS`: upload key alias. Required for AAB build modes.
- `ANDROID_KEYSTORE_STORE_PASS`: keystore password. Required for AAB build
  modes.
- `ANDROID_KEYSTORE_KEY_PASS`: key password. Required for AAB build modes.
- `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON`: Play Console service-account JSON. The
  secret must contain exactly one JSON object, with no surrounding Markdown,
  labels, or extra text after the closing brace. Required for Google Play upload
  and store-entry update modes.

The Play Console app for `org.cismypa.qtqmlextensionstestapp` must already
exist before the GitHub Action can upload to it. Protect the
`google-play-production` GitHub environment with required reviewers before using
the `production` track or store-entry update modes. Store-entry updates are
listing changes, not binary releases, and do not require a versionCode bump.

For local signed AAB builds:

```sh
./cmake-android.sh Release /path/to/upload.keystore "$ANDROID_KEYSTORE_KEY_PASS" "$ANDROID_KEYSTORE_STORE_PASS"
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
