import 'package:flutter/cupertino.dart';
import 'package:isekaitec/helpers/shared_preference_helper.dart';

class DarkThemeProvider with ChangeNotifier {
  SharedPreferenceHelper darkThemePreference = SharedPreferenceHelper();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
