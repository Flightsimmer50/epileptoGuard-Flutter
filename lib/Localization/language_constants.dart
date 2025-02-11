import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_localization.dart';

const String LAGUAGE_CODE = 'languageCode';

///languages code

const String ENGLISH = 'en';

const String FRENCH = 'fr';

const String ARABIC = 'ar';

const String KOREAN = 'ko';


Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LAGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";

  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');

    case FRENCH:
      return Locale(FRENCH, "FR");

    case KOREAN:
      return Locale(KOREAN, "KR");

    // case ARABIC:
    //   return Locale(ARABIC, "SA");

    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  final translated = DemoLocalization.of(context)?.translate(key);
  return translated ?? key;
}


