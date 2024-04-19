import 'package:contact_app/screens/detail/detail_screen.dart';
import 'package:contact_app/screens/hide/hide_contact.dart';
import 'package:contact_app/screens/home/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/addnew/new_screen.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const HomeScreen(),
  'addnew': (context) => const NewContactScreen(),
  'detail': (context) => const DetailScreen(),
  'hide': (context) => const HiddenContacts(),
};
