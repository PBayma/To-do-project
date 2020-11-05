import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_bloc/routes_utils.dart';
import 'package:project_bloc/screens/HomePage/bloc/homepage_bloc.dart';

final String _title = 'Contatos';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomePageBloc _bloc = HomePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: StreamBuilder(
          stream: _bloc.output,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data.docs.length == 0) {
              return Center(child: Text('Nenhum dado encontrado'));
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int i) {
                  var doc = snapshot.data.docs[i];
                  var item = doc.data();
                  var itemRef = doc.reference.id;

                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 3,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Text(item['number']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _bloc.deleteItem(itemRef),
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, createRoute),
        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
