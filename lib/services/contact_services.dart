import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_bloc/models/contact.dart';

class ContactServices {
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('ong');

  Stream<QuerySnapshot> get snapshots {
    return itemCollection.snapshots();
  }

  create(Contact contact) async {
    await itemCollection.add(contact.toJson());
  }

  delete(String item) async {
    return itemCollection.doc(item).delete();
  }
}
