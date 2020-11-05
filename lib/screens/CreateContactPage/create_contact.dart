import 'package:flutter/material.dart';
import 'package:project_bloc/screens/CreateContactPage/bloc/create_contact_bloc.dart';
import 'package:project_bloc/screens/CreateContactPage/components/text_input.dart';

final String _title = 'Adicionar Contatos';

const String _ongName = 'Nome';
const String _exempleName = 'Ex: Marcelo';

const String _ongDescription = 'Número';
const String _exempleDescription = 'Ex: 619991998877';

const String _buttonName = 'Cadastrar';

class CreateTodo extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final CreateContactBloc _bloc = CreateContactBloc();

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
              type: TextInputType.number,
            ),
            RaisedButton(
              child: Text(
                _buttonName,
              ),
              onPressed: () => _createOng(context),
            )
          ],
        ),
      ),
    );
  }

  void _createOng(BuildContext context) {
    final String _name = _controllerName.text;
    final String _number = _controllerDescription.text;
    if (_name != null && _number != null) {
      _bloc.createTodo(_name, _number);
      Navigator.pop(context);
    }
  }
}
