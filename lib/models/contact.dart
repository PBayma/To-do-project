import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String name;
  String number;
  DocumentReference reference;

  Contact(this.name, this.number);

  Contact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    return data;
  }

  //   @@@ Maybe use toMap() in another project @@@
  //   Map<String, dynamic> toMap() => {
  //   "done": done,
  //   "name": name
  // };
}
