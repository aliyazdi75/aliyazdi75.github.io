// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static m0(value) =>
      "To see the source code for this app, please visit the ${value}.";

  static m1(value) =>
      "I am graduated software engineering from Amirkabir University of Technology, which is ${value}. I am a Flutter Developer, who loves coding in Flutter. I am interested in Artificial Intelligence, Machine Learning, Natural Language and Software Engineering.";

  static m2(hours) => "${Intl.plural(hours, one: '1h', other: '${hours}h')}";

  static m3(minutes) =>
      "${Intl.plural(minutes, one: '1m', other: '${minutes}m')}";

  static m4(budgetName, amountUsed, amountTotal, amountLeft) =>
      "${budgetName} budget with ${amountUsed} used of ${amountTotal}, ${amountLeft} left";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "aboutDialogDescription": m0,
        "aboutFlutterSamplesRepo":
            MessageLookupByLibrary.simpleMessage("Flutter samples Github repo"),
        "aboutMe": m1,
        "aboutUniversityRank": MessageLookupByLibrary.simpleMessage(
            "is the second technical university in Iran"),
        "craneHours": m2,
        "craneMinutes": m3,
        "myName": MessageLookupByLibrary.simpleMessage("ALI YAZDI"),
        "mySiteTitle":
            MessageLookupByLibrary.simpleMessage("Ali Yazdi\'s Profile"),
        "myTitle": MessageLookupByLibrary.simpleMessage(
            "CS GRADUATE @ TEHRAN POLYTECHNIC"),
        "rallyBudgetAmount": m4,
        "resume": MessageLookupByLibrary.simpleMessage("Resume"),
        "signIn": MessageLookupByLibrary.simpleMessage("SIGN IN"),
        "welcomeTitle":
            MessageLookupByLibrary.simpleMessage("Hi there, welcome to my page")
      };
}
