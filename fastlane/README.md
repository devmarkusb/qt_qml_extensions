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
stable screenshot names to this metadata tree.

It expects Fastlane's gems, Android SDK platform tools, and a connected device
or emulator to be available locally. The screenshot harness uses its own Gradle
wrapper under `android-screenshot-tests/`.

Build or install the Qt Android app first, then run:

```sh
SCREENSHOT_CLEAR_PREVIOUS=1 \
QT_ANDROID_APP_APK_PATH=/path/to/qt_qml_extensions_testapp.apk \
bundle exec fastlane android screenshots
```

If the app is already installed on the device or emulator, omit
`QT_ANDROID_APP_APK_PATH`.

Useful overrides:

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
