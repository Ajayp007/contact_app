import 'package:contact_app/screens/home/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class ContactProvider with ChangeNotifier {
  List<ContactModel> contactList = [];
  List<ContactModel> hideContactList = [];
  List introPage=[];

  void addContact(ContactModel c1) {
    contactList.add(c1);
    notifyListeners();
  }

  void hideContact(int index) {
    hideContactList.add(contactList[index]);
    contactList.removeAt(index);
    notifyListeners();
  }

  void unHideContact(int index) {
    contactList.add(hideContactList[index]);
    hideContactList.removeAt(index);
    notifyListeners();
  }

  Future<bool?> authUser() async {
    bool check = true;
    LocalAuthentication auth = LocalAuthentication();
    final bool data = await auth.canCheckBiometrics;
    final bool canAuthenticate = data || await auth.isDeviceSupported();
    if (canAuthenticate) {
      List<BiometricType> availableBio = await auth.getAvailableBiometrics();
      if (availableBio.isNotEmpty) {
        check = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance ',
        );
      }
    }
    return check;
  }
}
