import 'package:contact_objectbox/controller/generatedcontroller.dart';
import 'package:contact_objectbox/view/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future updateContacts(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController numberController,
    WidgetRef ref,
    int index,
    [bool isedit = false]) async {
  final contact = ref.watch(contactcntrlProvider);
  nameController.text = contact[index].name;
  numberController.text = contact[index].number;

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Title(
            color: Colors.black,
            child: Text(
              isedit ? "UPDATE" : "Add",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter Name"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            controller: numberController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter Number"),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    numberController.text.isEmpty) {
                  toastinfo(msg: "cant be empty");
                } else {
                  ref.read(contactcntrlProvider.notifier).updatcontact(
                        nameController.text,
                        numberController.text,
                        contact[index].id,
                      );

                  nameController.clear();
                  numberController.clear();
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.check),
              label: const Text("UPDATE"))
        ],
      ),
    ),
  );
}

Future<dynamic> addToContact(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController numberController,
    WidgetRef ref,
    [bool isedit = false]) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Title(
            color: Colors.black,
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: numberController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Number",
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    numberController.text.isEmpty) {
                  toastinfo(msg: "cant be empty");
                } else {
                  ref.read(contactcntrlProvider.notifier).addtocontacts(
                      nameController.text, numberController.text);
                  nameController.clear();
                  numberController.clear();
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.check),
              label: const Text("ADD"))
        ],
      ),
    ),
  );
}
