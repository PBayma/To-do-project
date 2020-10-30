import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_bloc/models/todo.dart';

class TodoServices {
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('ong');

  Stream<QuerySnapshot> get snapshots {
    return itemCollection.snapshots();
  }

  create(ToDo todo) async {
    await itemCollection.add(todo.toJson());
  }

  delete(String item) async {
    return itemCollection.doc(item).delete();
  }

  // read() async {
  // List ongList = List();

  // FirebaseFirestore.instance.collection('ong').get().then((value) {
  //   // value.docs.map((e)  {
  //   //   e.data()
  //   // });
  //   value.docs.forEach((element) {
  //     var item = element.data();

  //     if (item['name'] != null && item['email'] != null) {
  //       Ong ong = Ong(item['name'], item['email'], item['phone']);

  //       ongList.add({ong.name, ong.email, ong.phone});
  //     }
  //   });
  // });

  // return ongList;
}
