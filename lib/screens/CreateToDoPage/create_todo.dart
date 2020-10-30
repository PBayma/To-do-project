import 'package:flutter/material.dart';
import 'package:project_bloc/screens/CreateToDoPage/bloc/create_todo_bloc.dart';
import 'package:project_bloc/screens/CreateToDoPage/components/text_input.dart';

final String _title = 'Crie sua Ong';

const String _ongName = 'Nome da Ong';
const String _exempleName = 'Ex: Ubuntu';

const String _ongDescription = 'Descreva suas atividades';
const String _exempleDescription = 'Ex: Ong voltada para causas animais...';

class CreateTodo extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final CreateTodoBloc _bloc = CreateTodoBloc();

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
      _bloc.createTodo(_name, _description);
      Navigator.pop(context);
    }
  }
}
