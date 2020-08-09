# Localization

## Creating New Localization

1. Import following packages as bellow:

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter

  intl: any
  intl_translation: any
  flutter_localized_locales: any
```

2. Create `lib/l10n/intl_en.dart` with following content:

```dart
flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/main.dart
```

```dart
{
  "@@last_modified": "2020-03-01T22:10:12.322932",
  "mySiteTitle": "Ali Yazdi Homepage",
  "@mySiteTitle": {
    "description": "Title for app."
  },
  "myName": "ALI YAZDI",
  "@myName": {
    "description": "My name."
  },
  "myTitle": "CE GRADUATED @ TEHRAN POLYTECHNIC",
  "@myTitle": {
    "description": "My title."
  },
  "welcomeTitle": "Hi there, welcome to my page",
  "@welcomeTitle": {
    "description": "Welcome title."
  },
  "aboutMe": "I am a Software Engineering graduate from Amirkabir University of Technology, which is one of the most prestigious universities in Iran, {value}. And a Developer, who loves programming in Flutter. I am also interested in Artificial Intelligence, Machine Learning and Software Engineering.",
  "@aboutMe": {
    "description": "About me.",
    "placeholders": {
      "value": {
        "example": "University rank in Iran link"
      }
    }
  },
  "aboutUniversityRank": "ranked second in IT",
  "@aboutUniversityRank": {
    "description": "University rank in Iran."
  }
}
```

3. To generate new translation create `lib/l10n/intl_fa.dart` with following content:

```dart
{
  "mySiteTitle": "صفحه شخصی علی یزدی",
  "myName": "علی یزدی",
  "myTitle": "فارغ التحصیل مهندسی کامپیوتر @ پلی‌تکنیک تهران",
  "welcomeTitle": "سلام، به صفحه شخصی من خوش آمدید",
  "aboutMe": "من فارغ التحصیل مهندسی نرم افزار از دانشگاه صنعتی امیرکبیر هستم، که این دانشگاه که یکی از معتبرترین دانشگاه‌ها در ایران و  {value} است. یک برنامه‌نویس هستم که عاشق برنامه‌نویسی با فلاتر است. همچنین من به هوش مصنوعی، یادگیری ماشین و مهندسی نرم‌افزار علاقه‌مند هستم.",
  "aboutUniversityRank": "رتبه دوم دانشگاه صنعتی"
}
```

4. To generate all Localization files from app directory run,
   `flutter pub run grinder l10n`, you can read below
   under *How to Generate GalleryLocalizations with Grinder*.

5. Add these following line in `lib/main.dart` as bellow:

```dart
MaterialApp(
    localizationsDelegates: [
      ...MySiteLocalizations.localizationsDelegates,
      LocaleNamesLocalizationsDelegate()
    ],
    supportedLocales: MySiteLocalizations.supportedLocales,
    locale: MySiteOptions.of(context).locale,
    localeResolutionCallback: (locale, supportedLocales) {
        final isSupported = supportedLocales.contains(
          supportedLocales.singleWhere(
            (element) => element.languageCode == locale?.languageCode,
            orElse: () => null,
          ),
        );
        if (isSupported) {
          deviceLocale = locale;
        } else {
          deviceLocale = supportedLocales.first;
        }
        return isSupported ? locale : supportedLocales.first;
    },
),
```

## Creating New Locale Messages

When adding new strings to be localized, update `intl_en.arb`, which
is used by this project as the template. When creating new entries, they
have to be in the following format:

```arb
  "dartGetterVariableName": "english translation of the message",
  "@dartGetterVariableName": {
    "description": "description that the localizations delegate will use."
  },
```

In this example, `dartGetterVariableName` should be the Dart method/property
name that you will be using in your localizations delegate.

After adding the new message in `intl_en.arb`, it can be used in the app by
regenerating the GalleryLocalizations delegate and the `messages_*.dart` files.
This allows use of the English message through your localizations delegate in
the application code immediately without having to wait for the translations
to be completed.

## How to Generate GalleryLocalizations with Grinder

From the app directory:
1. Make sure you have [grinder](https://pub.dev/packages/grinder) installed by
running `flutter pub get`.
2. Copy tool directory to your app's directory.
3. You have to customize `tool/grind.dart` to your `[name]Localizations`.
4. From `{your_flutter_path}/packages/flutter` run `flutter update-packages`
5. Then run `flutter pub run grinder l10n` to generate `[name]Localizations`.

For more details on what `flutter pub run grinder l10n` runs, you can read below
under *How to Generate Localizations with l10n scripts*. The current
supported locales list is sorted alphabetically. This means that after running
the script, you have to update `[name]_localizations.dart` and move the `en`
locale to the top of the list.

## How to Generate Localizations with l10n scripts
To generate GalleryLocalizations, from app directory run:

```dart
dart ${YOUR_FLUTTER_PATH}/dev/tools/localization/bin/gen_l10n.dart \
    --template-arb-file=intl_en.arb \
    --output-localization-file=[name]_localizations.dart \
    --output-class=GalleryLocalizations
```

From `YOUR_FLUTTER_PATH`, run `dart tool/l10n_cli/main.dart`, which
will generate `intl_en.xml`. This will be used by the internal translation
console to generate messages in the different locales.

Run the formatter to make the Flutter analyzer happy:
```
flutter format .
```

## Generating New Locale Arb Files

Use the internal tool to create the `intl_<locale>.arb` files once the
translations are ready.

## Generating Flutter Localization Files

If new translations are ready and the `intl_<locale>.arb` files are already
available, run the following commands to generate all necessary
`messages_<locale>.dart` files and the `localizations_delegate.dart` file:

```
flutter pub run grinder l10n
```

which is equal to

```dart
dart ${YOUR_FLUTTER_PATH}/dev/tools/localization/bin/gen_l10n.dart \
    --template-arb-file=intl_en.arb \
    --output-localization-file=gallery_localizations.dart \
    --output-class=GalleryLocalizations

flutter format .
```

This ensures the generated `.dart` files updated with the latest translations.
