import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension LocaleFormat on String {
  String formatDate(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    initializeDateFormatting(locale);
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(this);
    }
    catch(e) {
      return this;
    }
    return DateFormat.yMMMMEEEEd(locale).format(dateTime);
  }
}
