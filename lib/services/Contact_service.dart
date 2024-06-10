import 'package:contact_objectbox/model/contact_model.dart';
import 'package:contact_objectbox/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;

  late Box<ContactModel> contactBox;
  ObjectBox._create(this.store) {
    contactBox = store.box<ContactModel>();
  }
  static ObjectBox? _instance;
  static ObjectBox get instance {
    return _instance!;
  }

  static Future<ObjectBox> create() async {
    final direc = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(direc.path, "Contact "));
    final instance = ObjectBox._create(store);
    _instance = instance;
    return instance;
  }
}
