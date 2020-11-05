import 'package:flutter/material.dart';
import 'package:project_bloc/routes_utils.dart';
import 'package:project_bloc/screens/CreateContactPage/create_contact.dart';
import 'package:project_bloc/screens/HomePage/homepage.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case createRoute:
        return MaterialPageRoute(builder: (_) => CreateTodo());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
