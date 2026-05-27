# Android Screenshot Tests

This Gradle project is a small screenshot harness for the Qt Android test app.
It builds a debug host APK plus an instrumentation APK. The instrumentation test
launches the Qt app, drives the top-level QML navigation with UI Automator, and
captures screenshots through Fastlane `screengrab`.

The Fastlane lane expects Android SDK platform tools and a connected device or
emulator to be available locally. This project uses its checked-in Gradle
wrapper, so a global `gradle` install is not required.

Run it through Fastlane from the repository root:

```sh
SCREENSHOT_CLEAR_PREVIOUS=1 \
QT_ANDROID_APP_APK_PATH=/path/to/qt_qml_extensions_testapp.apk \
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
