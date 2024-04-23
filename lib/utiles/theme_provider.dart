import 'package:contact_app/utiles/share_preference.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  String? themeMode;

  void setTheme() async {
    themeMode = await getThemeMode();
    notifyListeners();
  }
}
