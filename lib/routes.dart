import 'package:flutter/material.dart';
import 'package:project_bloc/routes_utils.dart';
import 'package:project_bloc/screens/CreateToDoPage/create_todo.dart';
import 'package:project_bloc/screens/HomePage/homepage.dart';
import 'package:project_bloc/screens/ToDoPage/todo_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case createRoute:
        return MaterialPageRoute(builder: (_) => CreateTodo());
      case toDoRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ToDoPage(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
