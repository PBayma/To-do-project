import 'package:flutter/material.dart';
import 'package:project_bloc/models/todo.dart';
import 'package:project_bloc/screens/CreateOngPage/components/text_input.dart';
import 'package:project_bloc/services/todo_services.dart';

final String _title = 'Crie sua Ong';

const String _ongName = 'Nome da Ong';
const String _exempleName = 'Ex: Ubuntu';

const String _ongDescription = 'Descreva suas atividades';
const String _exempleDescription = 'Ex: Ong voltada para causas animais...';

class CreateTodo extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TodoServices todoServices = TodoServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextInput(
              controller: _controllerName,
              name: _ongName,
              exemple: _exempleName,
            ),
            TextInput(
              controller: _controllerDescription,
              name: _ongDescription,
              exemple: _exempleDescription,
            ),
            RaisedButton(
              child: Text(
                'Cadastrar',
              ),
              onPressed: () => _createOng(context),
            )
          ],
        ),
      ),
    );
  }

  // @@@@@
  // Create bloc for this class and call todoServices.Create there.
  // @@@@@
  void _createOng(BuildContext context) {
    final String _name = _controllerName.text;
    final String _description = _controllerDescription.text;
    if (_name != null && _description != null) {
      final createdOng = Todo(_name, _description);
      todoServices.create(createdOng);
      Navigator.pop(context);
    }
  }
}
