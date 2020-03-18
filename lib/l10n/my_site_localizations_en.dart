// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'my_site_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class MySiteLocalizationsEn extends MySiteLocalizations {
  MySiteLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mySiteTitle => 'Ali Yazdi Homepage';

  @override
  String get myName => 'ALI YAZDI';

  @override
  String get myTitle => 'CE GRADUATED @ TEHRAN POLYTECHNIC';

  @override
  String get welcomeTitle => 'Hi there, welcome to my page';

  @override
  String aboutMe(Object value) {
    return 'I am a Software Engineering graduate from Amirkabir University of Technology, which is one of the most prestigious universities in Iran, ${value}. And a Developer, who loves programming in Flutter. I am also interested in Artificial Intelligence, Machine Learning and Software Engineering.';
  }

  @override
  String get aboutUniversityRank => 'ranked second in IT';

  @override
  String get resume => 'Resume';

  @override
  String get aboutTitle => 'ABOUT';

  @override
  String get educationTitle => 'EDUCATION';

  @override
  String get experienceTitle => 'EXPERIENCE';

  @override
  String get awardsTitle => 'AWARDS';

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
  String get amirkabirStudyStart => 'September 2015';

  @override
  String get amirkabirStudyEnd => 'January 2020';

  @override
  String get schoolTitle => 'Adab High School';

  @override
  String get schoolCity => 'Tehran, Iran';

  @override
  String get schoolStudyStart => 'September 2011';

  @override
  String get schoolStudyEnd => 'June 2014';

  @override
  String get schoolStudyFieldTitle => 'Diploma in Physics and Mathematics';

  @override
  String get tarafdariTitle => 'Tarafdari';

  @override
  String get tarafdariCity => 'Tehran, Iran';

  @override
  String get tarafdariWorkStart => 'June 2019';

  @override
  String get tarafdariWorkEnd => 'Present';

  @override
  String get tarafdariTechnologies => 'Flutter, Drupal, Laravel, MySQL';

  @override
  String get tarafdariDescription =>
      'Tarafdari is the first and most popular sports social media network in Iran, providing official news and live scores of national and international matches.';

  @override
  String get tarafdariDuty1 =>
      'Studying and Researching about Flutter framework';

  @override
  String get tarafdariDuty2 => 'Developing requirement APIs';

  @override
  String get tarafdariDuty3 =>
      'Developing Tarafdari\'s client application and requirement plugins in Flutter, that is including multimedia content, live score matches, sports TV streaming with live chat on the socket.';

  @override
  String get applicationPage => 'Application Page';

  @override
  String get olympiadDate => 'July 2013';

  @override
  String get olympiadDescription =>
      'Qualified for the Second Round of the Iranian Physics Olympiad and Mathematical Olympiad';

  @override
  String get examDate => 'July 2015';

  @override
  String get examDescription =>
      'Ranked in top 0.2% among more than 180K participants in Nation-Wide University Entrance Exam among all Iranian Student of Physics and Mathematics';

  @override
  String get bestAppDate => 'February 2020';

  @override
  String bestAppDescription(Object value) {
    return 'First Place in the 12th Iran Web and Mobile Festival(${value}) for the Best Sport Mobile Application among 7k applications';
  }

  @override
  String get bestAppLink => 'IWMF';

  @override
  String get madeWith => 'Made with';

  @override
  String byTitle(Object value) {
    return 'by ${value}';
  }

  @override
  String get flutterTitle => 'Flutter';
}
