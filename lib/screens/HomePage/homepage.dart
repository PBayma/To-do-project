import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_bloc/screens/HomePage/bloc/homepage_bloc.dart';

final String _title = 'Bloc Exemple';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomePageBloc bloc = HomePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: StreamBuilder(
          stream: bloc.output,
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
                  print(doc.data());
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
                      subtitle: Text(item['description']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => null,
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/createOng'),
        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
