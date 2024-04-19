import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier
{
    ThemeMode selectTheme = ThemeMode.system;

    void changeTheme(mode)
    {
        selectTheme = mode;
        notifyListeners();
    }
}