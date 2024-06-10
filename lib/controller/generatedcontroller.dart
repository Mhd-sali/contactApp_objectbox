import 'package:contact_objectbox/model/contact_model.dart';
import 'package:contact_objectbox/objectbox.g.dart';
import 'package:contact_objectbox/services/Contact_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generatedcontroller.g.dart';

@riverpod
class Contactcntrl extends _$Contactcntrl {
  static final searchquery = ObjectBox.instance.contactBox
      .query(ContactModel_.name.contains(''))
      .order(ContactModel_.name)
      .build();

  @override
  List<ContactModel> build() {
    return getallcontacts();
  }

  void forquery(String value) {
    searchquery.param(ContactModel_.name).value = value;
    final contacts = searchquery.find();
    state = contacts;
  }

  List<ContactModel> getallcontacts() {
    final contacts = Contactcntrl.searchquery.find();
    state = contacts;
    return contacts;
  }

  void addtocontacts(String name, String number) {
    ObjectBox.instance.contactBox.put(ContactModel(name: name, number: number));
    getallcontacts();
  }

  void deletecontacts(int id) {
    ObjectBox.instance.contactBox.remove(id);
    getallcontacts();
  }

  void updatcontact(String name, String number, int id) {
    ObjectBox.instance.contactBox
        .put(ContactModel(name: name, number: number, id: id));
    getallcontacts();
  }
}
