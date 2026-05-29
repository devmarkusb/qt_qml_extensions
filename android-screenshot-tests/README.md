# Android Screenshot Tests

This Gradle project is a small screenshot harness for the Qt Android test app.
It builds a debug host APK plus an instrumentation APK. The instrumentation test
launches the Qt app, drives the top-level QML navigation with UI Automator, and
captures screenshots through Fastlane `screengrab`.

The Fastlane lane expects Android SDK platform tools and a connected device or
emulator to be available locally. This project uses its checked-in Gradle
wrapper, so a global `gradle` install is not required.

See `fastlane/README.md` for the full local flow: build the Qt Android APK,
start an emulator, then run `bundle exec fastlane android screenshots`.

Quick run from the repository root after the Qt app is built or installed:

```sh
SCREENSHOT_CLEAR_PREVIOUS=1 \
SCREENSHOT_USE_ADB_ROOT=1 \
SCREENSHOT_OUTPUT_DIRECTORY=artifacts/android-screenshots \
QT_ANDROID_APP_APK_PATH=/path/to/android-build-debug.apk \
bundle exec fastlane android screenshots
```

The Qt APK path is optional if the target app is already installed. By default,
the test launches package `org.cismypa.qtqmlextensionstestapp` and activity
`org.qtproject.qt.android.bindings.QtActivity`.

The default flow captures:

- `01-navigation`
- `02-controls`
- `03-colors`
- `04-layout`
- `05-fonts`
