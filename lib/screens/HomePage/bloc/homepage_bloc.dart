import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_bloc/services/contact_services.dart';

class HomePageBloc {
  ContactServices contactServices = ContactServices();

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream<QuerySnapshot> get output => contactServices.snapshots;

  deleteItem(String itemRef) {
    contactServices.delete(itemRef);
  }

  dispose() {
    _streamController.close();
  }
}
