import 'package:flutter/material.dart';

class AppLocale {
  AppLocale._();

  static const String path = 'assets/translations';

  static const indonesianID = Locale('id', 'ID');
  static const englishUS = Locale('en', 'US');

  static const List<Locale> supportedLocaleList = <Locale>[
    indonesianID,
    englishUS,
  ];

  static const Locale startLocale = englishUS;
  static const Locale fallbackLocale = englishUS;
}
