import 'package:flutter/cupertino.dart';
import 'package:localization_flutter/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

//language code
// const String ENGLISH= 'en';
// const String = 'ur';
// const String = 'es';
// const String = 'ar';
// const String = 'hi';
//
const String ENGLISH = 'en';
const String URDU = 'ur';
const String FARSI = 'es';
const String ARABIC = 'ar';
const String HINDI = 'hi';

const String LANGUAGE_CODE = "languageCode";
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode, 'US');
      break;
    case URDU:
      _temp = Locale(languageCode, 'PK');
      break;
    case FARSI:
      _temp = Locale(languageCode, 'IR');
      break;
    case ARABIC:
      _temp = Locale(languageCode, 'SA');
      break;
    case HINDI:
      _temp = Locale(languageCode, 'IN');
      break;

    default:
      _temp = Locale(ENGLISH, 'US');
      break;
  }
  return _temp;
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslatedValue(key);
}
