import 'dart:io';
import 'package:contact_app/screens/home/model/contact_model.dart';
import 'package:contact_app/screens/home/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  String? path;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtCompanyName = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtaddr = TextEditingController();

  String? phone, work, noLabel, office;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Contact",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                if (path != null) {
                  ContactModel c1 = ContactModel(
                    firstName: txtFirstName.text,
                    secondName: txtLastName.text,
                    image: path,
                    mobile: txtphone.text,
                    email: txtemail.text,
                  );
                  context.read<ContactProvider>().addContact(c1);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please Enter The Details"),
                    ),
                  );
                }
              }
            },
            child: Text(
              "Done",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer(
            builder: (context, value, child) => Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      path == null
                          ? CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              maxRadius: 60,
                              child: InkWell(
                                onTap: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(
                                    () {
                                      path = image!.path;
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.image_search,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(File(path!)),
                              maxRadius: 60,
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.82,
                          child: Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  icon: Icon(
                                    Icons.perm_identity_outlined,
                                    size: 30,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  hintText: "First Name",
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall),
                              controller: txtFirstName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.58,
                          child: Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  constraints:
                                      const BoxConstraints(maxWidth: 300),
                                  border: const OutlineInputBorder(),
                                  hintText: "Last Name",
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall),
                              controller: txtLastName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.82,
                          child: Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  icon: Icon(
                                    Icons.assured_workload_outlined,
                                    size: 30,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  hintText: "Company",
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall),
                              controller: txtCompanyName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Company Name is required";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.82,
                          child: Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                icon: Icon(
                                  Icons.call,
                                  size: 30,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                hintText: "Phone",
                                hintStyle:
                                    Theme.of(context).textTheme.labelSmall,
                              ),
                              controller: txtphone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Mobile Number";
                                } else if (value.length != 10) {
                                  return "please enter the 10 digits";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.63,
                          child: Flexible(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                              padding: const EdgeInsets.all(10),
                              items: [
                                DropdownMenuItem(
                                  value: "noLabel",
                                  child: Text(
                                    "No label",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "phone",
                                  child: Text("Phone",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ),
                                DropdownMenuItem(
                                  value: "work",
                                  child: Text("Work",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ),
                                DropdownMenuItem(
                                  value: "office",
                                  child: Text("Office",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.82,
                          child: Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  icon: Icon(
                                    Icons.email,
                                    size: 30,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  hintText: "Email",
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall),
                              controller: txtemail,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is required";
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return "please enter email properly";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
