import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/provider/contact_provider.dart';

class HiddenContacts extends StatefulWidget {
  const HiddenContacts({super.key});

  @override
  State<HiddenContacts> createState() => _HiddenContactsState();
}

class _HiddenContactsState extends State<HiddenContacts> {
  ContactProvider? provider;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    provider = context.read<ContactProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Hidden Contacts",
            style: Theme.of(context).textTheme.titleMedium),
        actions: [
          IconButton(
            onPressed: () {
              provider!.unHideContact(index);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.remove_red_eye_outlined),
          ),
        ],
      ),
      body: Consumer<ContactProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.hideContactList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'detail',
                    arguments: ['hide', index]);
              },
              leading: CircleAvatar(
                backgroundImage: FileImage(
                  File(
                      "${provider!.hideContactList[index].image}"),
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              title: Text(
                  "${provider!.hideContactList[index].firstName}"),
              subtitle: Text(
                  " ${provider!.hideContactList[index].secondName}"),
            );
          },
        ),
      ),
    );
  }
}
