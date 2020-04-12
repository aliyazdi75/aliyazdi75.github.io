import 'dart:async';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'my_site_localizations_en.dart';
import 'my_site_localizations_fa.dart';

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
///   intl: 0.16.1
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
abstract class MySiteLocalizations {
  MySiteLocalizations(String locale)
      : assert(locale != null),
        localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String localeName;

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
    Locale('en'),
    Locale('fa')
  ];

  // Title for app.
  String get mySiteTitle;

  // My name.
  String get myName;

  // My title.
  String get myTitle;

  // Welcome title.
  String get welcomeTitle;

  // About me.
  String aboutMe(Object value);

  // University rank in Iran.
  String get aboutUniversityRank;

  // Resume.
  String get resume;

  // About Title.
  String get aboutTitle;

  // Education Title.
  String get educationTitle;

  // Experience Title.
  String get experienceTitle;

  // Awards Title.
  String get awardsTitle;

  // Amirkabir University of Technology Title.
  String get amirkabirTitle;

  // Tehran Polytechnic Title.
  String get polytechnicTitle;

  // Amirkabir City.
  String get amirkabirCity;

  // Study Field Title.
  String get amirkabirStudyFieldTitle;

  // Study Duration.
  String get amirkabirStudyStart;

  // Study Duration.
  String get amirkabirStudyEnd;

  // Adab High School Title.
  String get schoolTitle;

  // School City.
  String get schoolCity;

  // Study Duration.
  String get schoolStudyStart;

  // Study Duration.
  String get schoolStudyEnd;

  // Study Field Title.
  String get schoolStudyFieldTitle;

  // Tarafdari Title.
  String get tarafdariTitle;

  // Work City.
  String get tarafdariCity;

  // Work Duration.
  String get tarafdariWorkStart;

  // Work Duration.
  String get tarafdariWorkEnd;

  // Tarafdari Technologies.
  String get tarafdariTechnologies;

  // Tarafdari Description.
  String get tarafdariDescription;

  // Tarafdari Duty.
  String get tarafdariDuty1;

  // Tarafdari Duty.
  String get tarafdariDuty2;

  // Tarafdari Duty.
  String get tarafdariDuty3;

  // Application Page Title.
  String get applicationPage;

  // olympiadDate.
  String get olympiadDate;

  // olympiadDescription.
  String get olympiadDescription;

  // examDate.
  String get examDate;

  // examDescription.
  String get examDescription;

  // bestAppDate.
  String get bestAppDate;

  // bestAppDescription.
  String bestAppDescription(Object value);

  // bestAppLink.
  String get bestAppLink;

  // Made With Title.
  String get madeWith;

  // By Title.
  String byTitle(Object value);

  // Flutter Title.
  String get flutterTitle;
}

class _MySiteLocalizationsDelegate
    extends LocalizationsDelegate<MySiteLocalizations> {
  const _MySiteLocalizationsDelegate();

  @override
  Future<MySiteLocalizations> load(Locale locale) {
    return SynchronousFuture<MySiteLocalizations>(
        _lookupMySiteLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_MySiteLocalizationsDelegate old) => false;
}

MySiteLocalizations _lookupMySiteLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return MySiteLocalizationsEn();
    case 'fa':
      return MySiteLocalizationsFa();
  }

  assert(false,
      'MySiteLocalizations.delegate failed to load unsupported locale "$locale"');
  return null;
}
