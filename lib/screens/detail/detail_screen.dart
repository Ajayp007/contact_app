import 'dart:io';

import 'package:contact_app/screens/home/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int index = 0;
  String name = '';

  ContactProvider? provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<ContactProvider>();
    List data = ModalRoute.of(context)!.settings.arguments as List;
    index = data[1];
    name = data[0];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {
              Share.share(
                  "${provider!.contactList[index].firstName}\n${provider!.contactList[index].secondName}\n${provider!.contactList[index].mobile}");
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              provider!.hideContact(index);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.hide_source),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(
                    File(
                        "${name == 'hide' ? provider!.hideContactList[index].image : provider!.contactList[index].image}"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "${name == 'hide' ? provider!.hideContactList[index].firstName : provider!.contactList[index].firstName}",
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      "${name == 'hide' ? provider!.hideContactList[index].secondName : provider!.contactList[index].secondName}",
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.indigo.shade100),
                    ),
                    onPressed: () async {
                      String call =
                          "tel:+91${name == 'hide' ? provider!.hideContactList[index].mobile : provider!.contactList[index].mobile}";
                      await launchUrl(Uri.parse(call));
                    },
                    icon: const Icon(Icons.local_phone_outlined),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.indigo.shade100),
                    ),
                    onPressed: () async {
                      String sms =
                          "sms:+91${name == 'hide' ? provider!.hideContactList[index].mobile : provider!.contactList[index].mobile}";
                      await launchUrl(Uri.parse(sms));
                    },
                    icon: const Icon(Icons.textsms_outlined),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.indigo.shade100),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.videocam_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Info",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.local_phone_outlined),
                        Flexible(
                          child: ListTile(
                            title: Text(
                              "+91 ${name == 'hide' ? provider!.hideContactList[index].mobile : provider!.contactList[index].mobile}",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            subtitle: Text(
                              "Phone",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                        const Icon(Icons.videocam_outlined),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.textsms_outlined),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connected Apps",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/wp.png",
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                          filterQuality: FilterQuality.medium,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "WhatsApp",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Text("Contact Settings",
                  style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.photo_album),
                  const SizedBox(width: 20),
                  Text(
                    "Reminder",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.block),
                  const SizedBox(width: 20),
                  Text(
                    "Block numbers",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.voicemail_outlined),
                  const SizedBox(width: 20),
                  Text(
                    "Rout to voicemail",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.link),
                  const SizedBox(width: 20),
                  Text(
                    "View linked contacts",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
