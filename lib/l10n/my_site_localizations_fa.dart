// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'my_site_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

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
    return 'من فارغ التحصیل مهندسی نرم افزار از دانشگاه صنعتی امیرکبیر هستم، که این دانشگاه که یکی از معتبرترین دانشگاه‌ها در ایران و  ${value} است. یک برنامه‌نویس هستم که عاشق برنامه‌نویسی با فلاتر است. همچنین من به هوش مصنوعی، یادگیری ماشین و مهندسی نرم‌افزار علاقه‌مند هستم.';
  }

  @override
  String get aboutUniversityRank => 'رتبه دوم دانشگاه صنعتی';

  @override
  String get resume => 'رزومه';

  @override
  String get aboutTitle => 'درباره';

  @override
  String get educationTitle => 'تحصیلات';

  @override
  String get experienceTitle => 'تجربه کاری';

  @override
  String get awardsTitle => 'افتخارات';

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
  String get amirkabirStudyStart => 'مهر ۱۳۹۴';

  @override
  String get amirkabirStudyEnd => 'دی ۱۳۹۸';

  @override
  String get schoolTitle => 'دبیرستان ادب';

  @override
  String get schoolCity => 'ایران، تهران';

  @override
  String get schoolStudyStart => 'مهر ۱۳۹۰';

  @override
  String get schoolStudyEnd => 'خرداد ۱۳۹۳';

  @override
  String get schoolStudyFieldTitle => 'دیپلم ریاضی و فیزیک';

  @override
  String get tarafdariTitle => 'طرفداری';

  @override
  String get tarafdariCity => 'ایران، تهران';

  @override
  String get tarafdariWorkStart => 'خرداد ۱۳۹۸';

  @override
  String get tarafdariWorkEnd => 'اکنون';

  @override
  String get tarafdariTechnologies => 'فلاتر، دروپال، لاراول، مای‌اس‌کیو‌ال';

  @override
  String get tarafdariDescription =>
      'طرفداری اولین و محبوب‌ترین رسانه و شبکه اجتماعی ورزشی در ایران است، که اخبار رسمی ورزشی و نتایج زنده بازی‌های داخلی و خارجی ورزشی را برای کاربران فراهم می‌کند.';

  @override
  String get tarafdariDuty1 => 'مطالعه و تحقیق در مورد فریم‌ورک فلاتر';

  @override
  String get tarafdariDuty2 => 'توسعه API های مورد نیاز اپلیکیشن';

  @override
  String get tarafdariDuty3 =>
      'توسعه اپلیکیشن طرفداری و پلاگین‌های موردنیاز با فلاتر، که این برنامه شامل محتوای چند رسانه‌ای، نتایج زنده بازی‌های ورزشی، استریمینگ پخش زنده بازی‌های ورزشی روی سوکت';

  @override
  String get applicationPage => 'صفحه برنامه';

  @override
  String get olympiadDate => 'تیر ۱۳۹۳';

  @override
  String get olympiadDescription =>
      'پذیرش برای مرحله دوم المپیاد فیزیک و المپیاد ریاضی';

  @override
  String get examDate => 'تیر ۱۳۹۴';

  @override
  String get examDescription =>
      'رتبه بالاترین ۰/۲٪ در میان بیش از ۱۸۰ هزار نفر شرکت‌کننده در کنکور سراسری ریاضی و فیزیک';

  @override
  String get bestAppDate => 'بهمن ۱۳۹۸';

  @override
  String bestAppDescription(Object value) {
    return 'مقام اول در دوازدهمین جشنواره وب و موبایل(${value}) برای بهترین برنامه ورزشی در میان ۷ هزار برنامه';
  }

  @override
  String get bestAppLink => 'IWMF';

  @override
  String get madeWith => 'ساخته شده با';

  @override
  String byTitle(Object value) {
    return 'توسط ${value}';
  }

  @override
  String get flutterTitle => 'فلاتر';
}
