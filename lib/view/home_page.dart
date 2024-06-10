import 'package:contact_objectbox/controller/generatedcontroller.dart';
import 'package:contact_objectbox/view/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactcntrlProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: Column(
        children: [
          TextField(
              onChanged: ref.read(contactcntrlProvider.notifier).forquery),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final cont = contacts[index];
                  return ListTile(
                    leading: const CircleAvatar(),
                    title: Text(cont.name),
                    subtitle: Text(cont.number),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton.outlined(
                            onPressed: () {
                              ref
                                  .read(contactcntrlProvider.notifier)
                                  .deletecontacts(cont.id);
                            },
                            icon: const Icon(Icons.delete)),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton.outlined(
                            onPressed: () {
                              updateContacts(context, nameController,
                                  numberController, ref, index);
                            },
                            icon: const Icon(Icons.edit)),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nameController.clear();
          numberController.clear();
          addToContact(context, nameController, numberController, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
