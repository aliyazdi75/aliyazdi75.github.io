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

1. Create a PR to bump the version number up in `pubspec.yaml`. Use [semantic versioning](https://semver.org/) to determine
   which number to increment. The version number after the `+`should also be incremented. For example `1.2.3+010203`
   with a patch should become `1.2.4+010204`.

2. Create a tag on the `main` branch of this repo in the form of
   `v1.0.0`.
	* `git tag v1.0.0`
	* `git push --tags`

3. Publish the web release (using the [peanut package](https://pub.dev/packages/peanut)).
    * `flutter pub global activate peanut`
    * `flutter pub global run peanut:peanut`
   *  `git push origin gh-pages:gh-pages`

4. Write some release notes about what changes have been done since the
   last release.

5. Publish the Android release (using the correct signing certificates).
   *  Create the APK with `flutter build apk` (this is for the Github
      release).

6. Publish the linux release on the Snapcraft.
   *  Create the `snap` with `sudo snapcraft`.
   *  `snapcraft login`

7. Go to [Releases](https://github.com/flutter/gallery/releases) and see
   the latest draft.
    * Include the release notes in the description.
    * Publish the release.
