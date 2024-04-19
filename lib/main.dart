import 'package:contact_app/screens/home/provider/contact_provider.dart';
import 'package:contact_app/utiles/app_routs.dart';
import 'package:contact_app/utiles/app_theme.dart';
import 'package:contact_app/utiles/share_preference.dart';
import 'package:contact_app/utiles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? themeMode = await getThemeMode();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ContactProvider()),
        ChangeNotifierProvider.value(value: ThemeProvider()),
      ],
      child: Consumer<ContactProvider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: app_routes,
          theme: light_Theme,
          darkTheme: dark_Theme,
          themeMode: themeMode == null
              ? ThemeMode.system
              : themeMode == 'light'
                  ? ThemeMode.light
                  : themeMode == 'dark'
                      ? ThemeMode.dark
                      : ThemeMode.system,
        ),
      ),
    ),
  );
}
