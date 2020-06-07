//import 'dart:html';

import 'package:flutter/material.dart';
import 'models/global.dart';
import './addtrip.dart';
//import 'package:trie/trie.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primarySwatch: Colors.cyan,
          fontFamily: 'Raleway'),
      home: MyHomePage(title: 'Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _onSaveIndex = 0;
  var trips = ['dummy'];

  void _onSave(String tripText) {
    setState(() {
      _onSaveIndex += 1;
      trips.add(tripText);
      print(_onSaveIndex);
      print(trips);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Screen UI assembly
    return Scaffold(
      appBar: PreferredSize(
        //add this to actually increase size of top bar and place appbar

        preferredSize: Size.fromHeight(100.0),

        child: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
                color: Colors.teal[900]),
          ),
          //centerTitle: true,
          backgroundColor: Colors.green[700],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // do something`
              },
            )
          ],
        ),
      ),
      //Container(height: 100,color: Colors.cyan,)

      body: ListView(
        children: [
          for (var i = 1; i <= _onSaveIndex; i++)
            Card(
              elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                child: ListTile(
                  //leading: Icon(Icons.radio_button_unchecked),
                  title: Text(trips[i]),
                  subtitle: Text('count'),
                  trailing: Icon(Icons.more_vert),
            ))
        ],
      ),
      // Create Side panel drawer
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.symmetric(),
          children: <Widget>[
            DrawerHeader(
              child: Text('Side Notes'),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Invite Friends'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addtrip(_onSave),
            ),
          );
        }, //
        backgroundColor: Colors.green[700],
        splashColor: Colors.green[900],
        //tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
