import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: unused_import
import 'package:intl/intl.dart' as intl;

// ignore_for_file: unnecessary_brace_in_string_interps

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
abstract class MySiteLocalizations {
  MySiteLocalizations(String locale)
      : assert(locale != null),
        _localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String _localeName;

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

  // Amirkabir University of Technology Title.
  String get amirkabirTitle;

  // Tehran Polytechnic Title.
  String get polytechnicTitle;

  // Amirkabir City.
  String get amirkabirCity;

  // Study Field Title.
  String get amirkabirStudyFieldTitle;

  // Study Duration.
  String get amirkabirStudyDuration;

  // Adab High School Title.
  String get schoolTitle;

  // School City.
  String get schoolCity;

  // Study Duration.
  String get schoolStudyDuration;

  // Study Field Title.
  String get schoolStudyFieldTitle;

  // Tarafdari Title.
  String get tarafdariTitle;

  // School City.
  String get tarafdariCity;

  // Work Duration.
  String get tarafdariWorkDuration;

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

/// The translations for English (`en`).
class MySiteLocalizationsEn extends MySiteLocalizations {
  MySiteLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mySiteTitle => 'Ali Yazdi Homepage';

  @override
  String get myName => 'ALI YAZDI';

  @override
  String get myTitle => 'CS GRADUATED @ TEHRAN POLYTECHNIC';

  @override
  String get welcomeTitle => 'Hi there, welcome to my page';

  @override
  String aboutMe(Object value) {
    return 'I am Software Engineering graduated from Amirkabir University of Technology, which is ${value}. I am a Flutter Developer, who loves coding in Flutter. I am also interested in Artificial Intelligence, Machine Learning, Natural Language and Software Engineering.';
  }

  @override
  String get aboutUniversityRank => 'the second technical university in Iran';

  @override
  String get resume => 'Resume';

  @override
  String get aboutTitle => 'ABOUT';

  @override
  String get educationTitle => 'EDUCATION';

  @override
  String get experienceTitle => 'EXPERIENCE';

  @override
  String get amirkabirTitle => 'Amirkabir University of Technology';

  @override
  String get polytechnicTitle => '(Tehran Polytechnic)';

  @override
  String get amirkabirCity => ', Tehran, Iran';

  @override
  String get amirkabirStudyFieldTitle =>
      'B.Sc., Computer Engineering, Software';

  @override
  String get amirkabirStudyDuration => 'September 2015 - January 2020';

  @override
  String get schoolTitle => 'Adab High School';

  @override
  String get schoolCity => ', Tehran, Iran';

  @override
  String get schoolStudyDuration => 'September 2011 - June 2014';

  @override
  String get schoolStudyFieldTitle => 'Diploma in Physics and Mathematics';

  @override
  String get tarafdariTitle => 'Tarafdari';

  @override
  String get tarafdariCity => ', Tehran, Iran';

  @override
  String get tarafdariWorkDuration => 'June 2019 - Present';

  @override
  String get tarafdariTechnologies => 'Flutter, Drupal, Laravel, MySQL';

  @override
  String get tarafdariDescription =>
      'Tarafdari is the first and most popular sport social media network in Iran, that provides official sport news and live score matches.';

  @override
  String get tarafdariDuty1 => 'Studying Researching about Flutter framework';

  @override
  String get tarafdariDuty2 => 'Developing requirement APIs';

  @override
  String get tarafdariDuty3 =>
      'Developing Tarafdari flutter application and requirement plugins, that is including multimedia content, score live score matches, sport TV streaming with live chat on socket. Android application is available on the link below.';
}

/// The translations for Persian (`fa`).
class MySiteLocalizationsFa extends MySiteLocalizations {
  MySiteLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get mySiteTitle => 'صفحه شخصی علی یزدی';

  @override
  String get myName => 'علی یزدی';

  @override
  String get myTitle => 'فارغ التحصیل مهندسی کامپیوتر @ پلی‌تکنیک تهران';

  @override
  String get welcomeTitle => 'سلام، به صفحه شخصی من خوش آمدید';

  @override
  String aboutMe(Object value) {
    return 'من فارغ التحصیل مهندسی نرم افزار از دانشگاه صنعتی امیرکبیر هستم، که این دانشگاه ${value} است. من یک برنامه‌نویس فلاتر هستم که عاشق برنامه‌نویسی با فلاتر هستم. همچنین من به هوش مصنوعی، یادگیری ماشین، زبان طبیعی و مهندسی نرم‌افزار علاقه‌مند هستم.';
  }

  @override
  String get aboutUniversityRank => 'رتبه دوم بهترین دانشگاه ایران';

  @override
  String get resume => 'رزومه';

  @override
  String get aboutTitle => 'درباره';

  @override
  String get educationTitle => 'تحصیلات';

  @override
  String get experienceTitle => 'تجربه کاری';

  @override
  String get amirkabirTitle => 'دانشگاه صنعتی امیرکبیر';

  @override
  String get polytechnicTitle => '(پلی‌تکنیک تهران)';

  @override
  String get amirkabirCity => '، ایران، تهران';

  @override
  String get amirkabirStudyFieldTitle =>
      'کارشناسی مهندسی کامپیوتر، گرایش نرم‌افزار';

  @override
  String get amirkabirStudyDuration => 'مهر ۱۳۹۴ - دی ۱۳۹۸';

  @override
  String get schoolTitle => 'دبیرستان ادب';

  @override
  String get schoolCity => '، ایران، تهران';

  @override
  String get schoolStudyDuration => 'مهر ۱۳۹۰ - خرداد ۱۳۹۳';

  @override
  String get schoolStudyFieldTitle => 'دیپلم ریاضی و فیزیک';

  @override
  String get tarafdariTitle => 'طرفداری';

  @override
  String get tarafdariCity => '، ایران، تهران';

  @override
  String get tarafdariWorkDuration => 'خرداد ۱۳۹۸ - اکنون';

  @override
  String get tarafdariTechnologies => 'فلاتر، دروپال، لاراول، مای‌اس‌کیو‌ال';

  @override
  String get tarafdariDescription =>
      'طرفداری اولین و محبوب‌ترین رسانه و شبکه اجتماعی ورزشی در ایران است، که اخبار رسمی ورزشی و نتایج زنده بازی‌های ورزشی را برای کاربران فراهم می‌کند.';

  @override
  String get tarafdariDuty1 => 'مطالعه و تحقیق در مورد فریم‌ورک فلاتر';

  @override
  String get tarafdariDuty2 => 'توسعه API های مورد نیاز اپلیکیشن';

  @override
  String get tarafdariDuty3 =>
      'توسعه اپلیکیشن فلاتر طرفداری و پلاگین‌های موردنیاز، که ایین برنامه شامل محتوای چند رسانه‌ای، نتایج زنده بازی‌های ورزشی، استریمینگ پخش زنده بازی‌های ورزشی روی سوکت. اپلیکیشن اندروید در لینک زیر در دسترس قرار دارد.';
}

MySiteLocalizations _lookupMySiteLocalizations(Locale locale) {
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
