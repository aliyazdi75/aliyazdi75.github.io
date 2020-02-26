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

2. Create `lib/l10n/intl_en_US.dart` with following content:

```dart
{
  "aboutFlutterSamplesRepo": "Flutter samples Github repo",
  "@aboutFlutterSamplesRepo": {
    "description": "Represents a link to the Flutter samples github repository."
  },
  "aboutDialogDescription": "To see the source code for this app, please visit the {value}.",
  "@aboutDialogDescription": {
    "description": "A description about how to view the source code for this app.",
    "placeholders": {
      "value": {
        "example": "Flutter samples Github repo"
      }
    }
  },
  "signIn": "SIGN IN",
  "@signIn": {
    "description": "Sign in label to sign into website."
  },
  "rallyBudgetAmount": "{budgetName} budget with {amountUsed} used of {amountTotal}, {amountLeft} left",
  "@rallyBudgetAmount": {
    "description": "Semantics label for row with a budget (housing budget for example), with how much is used of the budget (for example $5), the total budget (for example $100) and the amount left in the budget (for example $95).",
    "placeholders": {
      "budgetName": {
        "example": "Groceries"
      },
      "amountUsed": {
        "example": "$5"
      },
      "amountTotal": {
        "example": "$100"
      },
      "amountLeft": {
        "example": "$95"
      }
    }
  },
  "craneHours": "{hours, plural, =1{1h} other{{hours}h}}",
  "@craneHours": {
    "description": "Generic text for an amount of hours, abbreviated to the shortest form. For example 1h. {hours} should remain untranslated.",
    "placeholders": {
      "hours": {
        "example": "1"
      }
    }
  },
  "craneMinutes": "{minutes, plural, =1{1m} other{{minutes}m}}",
  "@craneMinutes": {
    "description": "Generic text for an amount of minutes, abbreviated to the shortest form. For example 15m. {minutes} should remain untranslated.",
    "placeholders": {
      "minutes": {
        "example": "15"
      }
    }
  },
  "mySiteTitle": "Ali Yazdi Homepage",
  "@mySiteTitle": {
    "description": "Title for app."
  }
}
```

3. To generate new translation create `lib/l10n/intl_fa.dart` with following content:

```dart
{
  "aboutFlutterSamplesRepo": "مخزن جی‌تاب نمونه‌های فلاتر",
  "aboutDialogDescription": "برای دیدن کد منبع این برنامه ، لطفاً {value} را ببینید.",
  "signIn": "ورود به سیستم",
  "rallyBudgetAmount": "بودجه {budgetName} با مبلغ کلی {amountTotal} که {amountUsed} از آن مصرف‌شده و {amountLeft} باقی‌مانده است",
  "craneHours": "{hours, plural, =1{1h} other{{hours}h}}",
  "craneMinutes": "{minutes, plural, =1{1m} other{{minutes}m}}",
  "mySiteTitle": "پروفایل علی یزدی"
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
      deviceLocale = locale;
      return locale;
    },
),
```

## Creating New Locale Messages

When adding new strings to be localized, update `intl_en_US.arb`, which
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

After adding the new message in `intl_en_US.arb`, it can be used in the app by
regenerating the Localizations delegate and the `messages_*.dart` files.
This allows use of the English message through your localizations delegate in
the application code immediately without having to wait for the translations
to be completed.

## How to Generate GalleryLocalizations with Grinder

From the app directory:
1. Make sure you have [grinder](https://pub.dev/packages/grinder) installed by
running `flutter pub get`.
2. Copy tool directory to your app's directory.
3. You have to customize `tool/grind.dart` to your `[name]Localizations`.
4. Then run `flutter pub run grinder l10n` to generate `[name]Localizations`.

For more details on what `flutter pub run grinder l10n` runs, you can read below
under *How to Generate Localizations with l10n scripts*. The current
supported locales list is sorted alphabetically. This means that after running
the script, you have to update `[name]_localizations.dart` and move the `en_US`
locale to the top of the list.

## How to Generate Localizations with l10n scripts
To generate GalleryLocalizations, from app directory run:

```dart
dart ${YOUR_FLUTTER_PATH}/dev/tools/localization/bin/gen_l10n.dart \
    --template-arb-file=intl_en_US.arb \
    --output-localization-file=[name]_localizations.dart \
    --output-class=GalleryLocalizations
```

From `samples/gallery/`, run `dart tool/l10n_cli/main.dart`, which
will generate `intl_en_US.xml`. This will be used by the internal translation
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
    --template-arb-file=intl_en_US.arb \
    --output-localization-file=gallery_localizations.dart \
    --output-class=GalleryLocalizations

flutter format .
```

This ensures the generated `.dart` files updated with the latest translations.
