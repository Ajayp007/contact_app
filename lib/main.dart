import 'package:contact_app/screens/home/provider/contact_provider.dart';
import 'package:contact_app/utiles/app_routs.dart';
import 'package:contact_app/utiles/app_theme.dart';
import 'package:contact_app/utiles/share_preference.dart';
import 'package:contact_app/utiles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ContactProvider()),
        ChangeNotifierProvider.value(value: ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          getThemeMode();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: app_routes,
            theme: light_Theme,
            darkTheme: dark_Theme,
            themeMode: value.themeMode == null
                ? ThemeMode.system
                : value.themeMode == 'light'
                    ? ThemeMode.light
                    : value.themeMode == 'dark'
                        ? ThemeMode.dark
                        : ThemeMode.system,
          );
        },
      ),
    ),
  );
}
