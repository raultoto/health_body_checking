import 'package:flutter/material.dart';

import '../caches/shared_preference/shared_preferences_helper.dart';

class LanguageProvider extends ChangeNotifier {
  // shared pref object
  SharedPreferenceHelper _sharedPrefsHelper;

  Locale _appLocale = Locale('en');

  LanguageProvider() {
    _sharedPrefsHelper = SharedPreferenceHelper();
  }

  Locale get appLocale {
    _sharedPrefsHelper.appLocale.then((localeValue) {
      if (localeValue != null) {
        _appLocale = Locale(localeValue);
      }
    });

    return _appLocale;
  }

  void updateLanguage(String languageCode) {
    if (languageCode == "es") {
      _appLocale = Locale("es");
    } else {
      _appLocale = Locale("en");
    }

    _sharedPrefsHelper.changeLanguage(languageCode);
    notifyListeners();
  }
}
