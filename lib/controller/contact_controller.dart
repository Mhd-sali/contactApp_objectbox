import 'package:contact_objectbox/model/contact_model.dart';
import 'package:contact_objectbox/services/Contact_service.dart';
import 'package:flutter/material.dart';

class ContactController {
  static List<ContactModel> getContact() {
    return ObjectBox.instance.contactBox.getAll();
  }

  static void addContact(String name, String number) {
    ObjectBox.instance.contactBox.put(ContactModel(name: name, number: number));
  }

  static void delete(int id) {
    ObjectBox.instance.contactBox.remove(id);
  }

  static void update(BuildContext context, int id, String name, String number) {
    ObjectBox.instance.contactBox
        .put(ContactModel(id: id, name: name, number: number));
  }

  static void removeAll() {
    ObjectBox.instance.contactBox.removeAll();
  }
}

