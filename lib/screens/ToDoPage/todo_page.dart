import 'package:flutter/material.dart';

// Remove this class and create BottomSheet
class ToDoPage extends StatelessWidget {
  final String itemRef;

  ToDoPage(this.itemRef);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anotação'),
      ),
    );
  }
}
