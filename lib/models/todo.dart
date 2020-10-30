import 'package:cloud_firestore/cloud_firestore.dart';

class ToDo {
  String name;
  String description;
  DocumentReference reference;

  ToDo(this.name, this.description);

  ToDo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }

  //   @@@ Maybe use toMap() in another project @@@
  //   Map<String, dynamic> toMap() => {
  //   "done": done,
  //   "name": name
  // };
}
