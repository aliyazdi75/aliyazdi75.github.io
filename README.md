[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/aliyazdi)

# my_site

A responsive Flutter portfolio application for any platforms

## Structure

## Build Launcher Icon

```
flutter pub run flutter_launcher_icons:main
```

## Generating Flutter Localization Files

For more information go to `lib/l10n/README.md`.

```
flutter pub run grinder l10n
```

## Creating a new release

1. Create a PR to bump the version number up in `pubspec.yaml`. Use
   [semantic versioning](https://semver.org/) to determine which number
   to increment. The version number after the `+` should also be
   incremented. For example `1.2.3+010203` with a patch should become
   `1.2.4+010204`.

2. Create a tag on the `main` branch of this repo in the form of
   `v1.0.0`.
	* `git tag v1.0.0`
	* `git push --tags`

3. Publish the web release (using the [peanut package](https://pub.dev/packages/peanut))
   (Note: if you have a custom domain, first copy the `CNAME` file into web folder).
    * `flutter pub global activate peanut`
    * `flutter pub global run peanut:peanut`
    *  `git push origin gh-pages:gh-pages`

4. Write some release notes about what changes have been done since the
   last release.

5. Publish the Android release (using the correct signing certificates).
   *  Create the APK with `flutter build apk`

6. Publish the linux release on the Snapcraft.
   *  Create the `snap` with `snapcraft`
   *  `snapcraft login`
   *  For the first time: `snapcraft register aliyazdi`
   *  `snapcraft upload --release=stable aliyazdi_*_amd64.snap`

7. Go to [Releases](https://github.com/aliyazdi75/aliyazdi75.github.io/releases) and see
   the latest draft.
    * Include the release notes in the description.
    * Publish the release.
