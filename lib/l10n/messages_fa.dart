// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fa locale. All the
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
  String get localeName => 'fa';

  static m0(value) =>
      "برای دیدن کد منبع این برنامه ، لطفاً ${value} را ببینید.";

  static m2(hours) => "${Intl.plural(hours, one: '1h', other: '${hours}h')}";

  static m3(minutes) =>
      "${Intl.plural(minutes, one: '1m', other: '${minutes}m')}";

  static m4(budgetName, amountUsed, amountTotal, amountLeft) =>
      "بودجه ${budgetName} با مبلغ کلی ${amountTotal} که ${amountUsed} از آن مصرف‌شده و ${amountLeft} باقی‌مانده است";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "aboutDialogDescription": m0,
        "aboutFlutterSamplesRepo":
            MessageLookupByLibrary.simpleMessage("مخزن جی‌تاب نمونه‌های فلاتر"),
        "craneHours": m2,
        "craneMinutes": m3,
        "mySiteTitle": MessageLookupByLibrary.simpleMessage("پروفایل علی یزدی"),
        "rallyBudgetAmount": m4,
        "signIn": MessageLookupByLibrary.simpleMessage("ورود به سیستم")
      };
}
