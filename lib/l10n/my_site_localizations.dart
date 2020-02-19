import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

/// Callers can lookup localized strings with an instance of MySiteLocalizations returned
/// by `MySiteLocalizations.of(context)`.
///
/// Applications need to include `MySiteLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/my_site_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: MySiteLocalizations.localizationsDelegates,
///   supportedLocales: MySiteLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: 0.16.0
///   intl_translation: 0.17.7
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the MySiteLocalizations.supportedLocales
/// property.

// ignore_for_file: unnecessary_brace_in_string_interps

class MySiteLocalizations {
  MySiteLocalizations(Locale locale)
      : _localeName = Intl.canonicalizedLocale(locale.toString());

  final String _localeName;

  static Future<MySiteLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then<MySiteLocalizations>((_) => MySiteLocalizations(locale));
  }

  static MySiteLocalizations of(BuildContext context) {
    return Localizations.of<MySiteLocalizations>(context, MySiteLocalizations);
  }

  static const LocalizationsDelegate<MySiteLocalizations> delegate =
      _MySiteLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('fa'),
  ];

  String aboutDialogDescription(Object value) {
    return Intl.message(
        'To see the source code for this app, please visit the ${value}.',
        locale: _localeName,
        name: 'aboutDialogDescription',
        desc: 'A description about how to view the source code for this app.',
        args: <Object>[value]);
  }

  String get aboutFlutterSamplesRepo {
    return Intl.message('Flutter samples Github repo',
        locale: _localeName,
        name: 'aboutFlutterSamplesRepo',
        desc: 'Represents a link to the Flutter samples github repository.');
  }

  String craneHours(int hours) {
    return Intl.plural(hours,
        locale: _localeName,
        name: 'craneHours',
        desc:
            'Generic text for an amount of hours, abbreviated to the shortest form. For example 1h. {hours} should remain untranslated.',
        args: <Object>[hours],
        one: '1h',
        other: '${hours}h');
  }

  String craneMinutes(int minutes) {
    return Intl.plural(minutes,
        locale: _localeName,
        name: 'craneMinutes',
        desc:
            'Generic text for an amount of minutes, abbreviated to the shortest form. For example 15m. {minutes} should remain untranslated.',
        args: <Object>[minutes],
        one: '1m',
        other: '${minutes}m');
  }

  String get mySiteTitle {
    return Intl.message("Ali Yazdi's Profile",
        locale: _localeName, name: 'mySiteTitle', desc: 'Title for app.');
  }

  String rallyBudgetAmount(Object budgetName, Object amountUsed,
      Object amountTotal, Object amountLeft) {
    return Intl.message(
        '${budgetName} budget with ${amountUsed} used of ${amountTotal}, ${amountLeft} left',
        locale: _localeName,
        name: 'rallyBudgetAmount',
        desc: r'Semantics label for row with a budget (housing budget for example), with how much is used of the budget (for example $5), the total budget (for example $100) and the amount left in the budget (for example $95).',
        args: <Object>[budgetName, amountUsed, amountTotal, amountLeft]);
  }

  String get signIn {
    return Intl.message('SIGN IN',
        locale: _localeName,
        name: 'signIn',
        desc: 'Sign in label to sign into website.');
  }
}

class _MySiteLocalizationsDelegate
    extends LocalizationsDelegate<MySiteLocalizations> {
  const _MySiteLocalizationsDelegate();

  @override
  Future<MySiteLocalizations> load(Locale locale) =>
      MySiteLocalizations.load(locale);

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_MySiteLocalizationsDelegate old) => false;
}
