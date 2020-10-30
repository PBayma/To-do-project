import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String exemple;

  // Use {} on constructor to have optional parameter
  TextInput({this.controller, this.name, this.exemple});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          labelText: name,
          hintText: exemple,
        ),
      ),
    );
  }
}
