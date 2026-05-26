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
