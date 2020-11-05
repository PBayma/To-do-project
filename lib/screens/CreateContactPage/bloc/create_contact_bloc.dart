import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_bloc/models/contact.dart';
import 'package:project_bloc/services/contact_services.dart';

class CreateContactBloc {
  final ContactServices todoServices = ContactServices();

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream<QuerySnapshot> get output => _streamController.stream;

  createTodo(String name, String number) {
    final createdOng = Contact(name, number);
    todoServices.create(createdOng);
  }

  dispose() {
    _streamController.close();
  }
}
