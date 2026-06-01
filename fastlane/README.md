# Google Play Store Entry

The Android release workflow uploads this directory with Fastlane `supply` when
`release_mode` is `update_store_entry_only` or `publish_build_and_store_entry`.

Text metadata lives under `metadata/android/<locale>/`:

- `title.txt`
- `short_description.txt`
- `full_description.txt`

Images live under `metadata/android/<locale>/images/`. Fastlane accepts `png`,
`jpg`, or `jpeg` files and maps these names to Google Play image types:

- `icon.png`
- `featureGraphic.png`
- `promoGraphic.png`
- `tvBanner.png`

Screenshot directories are uploaded in filename order:

- `phoneScreenshots/`
- `sevenInchScreenshots/`
- `tenInchScreenshots/`
- `tvScreenshots/`
- `wearScreenshots/`

Image and screenshot uploads replace the corresponding current Play Store set.
Keep the complete intended set in this directory before publishing.

## Capturing Android Screenshots

The `screenshots` lane builds a small UI Automator screenshot harness from
`android-screenshot-tests/`, runs it through Fastlane `screengrab`, and writes
stable screenshot names to the Fastlane output directory.

### Prerequisites

- Ruby 3.2+ and Bundler 2.7 (`bundle install` from the repository root)
- Android SDK with `platform-tools`, `emulator`, and a running device or AVD
- Qt 6.9.3 host tools plus the matching Qt for Android kit for your device ABI
  (`android_arm64_v8a` on Apple Silicon, `android_x86_64` on typical Linux CI)

Set `ANDROID_HOME` or `ANDROID_SDK_ROOT` to your SDK path before running ADB or
Fastlane.

### Build the Qt Android APK

From the repository root, configure and build a debug APK with `qt-cmake`.
Adjust `QT_HOST_PATH`, `QT_ANDROID_ROOT`, and `QT_ANDROID_ABIS` for your local
Qt install and target device:

```sh
export ANDROID_HOME=/path/to/Android/Sdk
export ANDROID_NDK_ROOT="$ANDROID_HOME/ndk/28.0.13004108"
export QT_ANDROID_ROOT=/path/to/Qt/6.9.3/android_arm64_v8a
export QT_HOST_PATH=/path/to/Qt/6.9.3/macos
export BUILD_DIR=build/android-screenshots-local

"$QT_ANDROID_ROOT/bin/qt-cmake" \
  -S . \
  -B "$BUILD_DIR" \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_CXX_STANDARD=26 \
  -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=./devenv/cmake/fetch-content-from-lockfile.cmake \
  -DANDROID_NDK_ROOT="$ANDROID_NDK_ROOT" \
  -DANDROID_SDK_ROOT="$ANDROID_HOME" \
  -DMB_UL_DEPLOYMENT_BUILD=ON \
  -DQT_ANDROID_ABIS=arm64-v8a \
  -DQT_ANDROID_MIN_SDK_VERSION=23 \
  -DQT_ANDROID_PACKAGE_NAME=org.cismypa.qtqmlextensionstestapp \
  -DQT_ANDROID_SDK_BUILD_TOOLS_REVISION=35.0.0 \
  -DQT_ANDROID_TARGET_SDK_VERSION=35 \
  -DQT_ANDROID_VERSION_CODE=1 \
  -DQT_ANDROID_VERSION_NAME=screenshots-local \
  -DQT_HOST_PATH="$QT_HOST_PATH" \
  -DUL_DEPLOYMENT_BUILD=ON

cmake --build "$BUILD_DIR" --target apk
```

The APK path is usually
`$BUILD_DIR/android-build/build/outputs/apk/debug/android-build-debug.apk`.

Start an emulator or connect a device before capturing screenshots.

### Capture screenshots

Run Fastlane from the repository root:

```sh
export ANDROID_HOME=/path/to/Android/Sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"

SCREENSHOT_CLEAR_PREVIOUS=1 \
SCREENSHOT_USE_ADB_ROOT=1 \
SCREENSHOT_OUTPUT_DIRECTORY=artifacts/android-screenshots \
QT_ANDROID_APP_APK_PATH="$BUILD_DIR/android-build/build/outputs/apk/debug/android-build-debug.apk" \
bundle exec fastlane android screenshots
```

If the app is already installed on the device or emulator, omit
`QT_ANDROID_APP_APK_PATH`.

Output files are written under
`artifacts/android-screenshots/<locale>/images/phoneScreenshots/` by default in
the command above. Open `artifacts/android-screenshots/screenshots.html` for a
local preview.

To write directly into this Play metadata tree instead, omit
`SCREENSHOT_OUTPUT_DIRECTORY` or set it to `fastlane/metadata/android`.

The default flow captures:

- `01-navigation`
- `02-controls`
- `03-colors`
- `04-layout`
- `05-fonts`

CI uses the same lane via `.github/workflows/android-screenshots.yml` and uploads
the `artifacts/android-screenshots` directory as a workflow artifact.

### Useful overrides

- `QT_ANDROID_TARGET_PACKAGE`: app package to launch. Defaults to
  `org.cismypa.qtqmlextensionstestapp`.
- `QT_ANDROID_TARGET_ACTIVITY`: app activity to launch. Defaults to Qt's
  `org.qtproject.qt.android.bindings.QtActivity`.
- `SCREENSHOT_DEVICE_TYPE`: Fastlane device bucket, for example `phone`,
  `sevenInch`, or `tenInch`. Defaults to `phone`.
- `SCREENSHOT_OUTPUT_DIRECTORY`: Fastlane output root. Defaults to
  `fastlane/metadata/android`.
- `SCREENSHOT_CLEAR_PREVIOUS=1`: clear previous screenshots in Fastlane output
  before writing new files.
- `SCREENSHOT_SKIP_GRADLE=1`: skip the screenshot harness Gradle build when the
  APKs were already built, for example in CI before the emulator starts.
- `SCREENSHOT_USE_ADB_ROOT=1`: restart ADB as root before pulling screenshots.
  Required on CI emulators: the harness writes PNGs under the host app's
  `Android/data/.../files/screengrab/` directory, which Fastlane pulls with root.
- `SCREENSHOT_LAUNCHTIMEOUTMS`, `SCREENSHOT_OBJECTTIMEOUTMS`,
  `SCREENSHOT_RENDERSETTLEMS`: optional instrumentation timeouts for slow
  emulators (milliseconds).
