import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_bloc/models/todo.dart';
import 'package:project_bloc/services/todo_services.dart';

class CreateTodoBloc {
  final TodoServices todoServices = TodoServices();

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream<QuerySnapshot> get output => _streamController.stream;

  createTodo(String name, String description) {
    final createdOng = ToDo(name, description);
    todoServices.create(createdOng);
  }

  dispose() {
    _streamController.close();
  }
}
