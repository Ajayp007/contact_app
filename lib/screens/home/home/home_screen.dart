import 'dart:io';
import 'package:contact_app/screens/home/provider/contact_provider.dart';
import 'package:contact_app/utiles/share_preference.dart';
import 'package:contact_app/utiles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts", style: Theme.of(context).textTheme.titleMedium),
        actions: [
          IconButton(
            style: Theme.of(context).iconButtonTheme.style,
            onPressed: () async {
              bool? authUser = await context.read<ContactProvider>().authUser();
              if (authUser == true) {
                Navigator.pushNamed(context, 'hide');
              }
            },
            icon: const Icon(Icons.remove_red_eye_outlined),
          ),
          PopupMenuButton(
            iconColor: Theme.of(context).iconTheme.color,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    setThemeMode('light');
                    context.read<ThemeProvider>().setTheme();
                  },
                  textStyle: Theme.of(context).popupMenuTheme.textStyle,
                  child: const Text("Light"),
                ),
                PopupMenuItem(
                  onTap: () {
                    setThemeMode('dark');
                    context.read<ThemeProvider>().setTheme();
                  },
                  child: const Text("Dark"),
                ),
                PopupMenuItem(
                  onTap: () {
                    setThemeMode('system');
                    context.read<ThemeProvider>().setTheme();
                  },
                  child: const Text("System"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.contactList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'detail',
                    arguments: ['home', index]);
              },
              leading: value.contactList[index].image == null
                  ? const CircleAvatar()
                  : CircleAvatar(
                      backgroundImage: FileImage(
                        File("${value.contactList[index].image}"),
                      ),
                    ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              title: Text(
                "${value.contactList[index].firstName}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              subtitle: Text(
                " ${value.contactList[index].secondName}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addnew');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
