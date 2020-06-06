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
      title: 'Trackenser',
      theme: ThemeData(
        //primarySwatch: Colors.cyan,
          fontFamily: 'Raleway'
      ),
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
  int _selectedTabIndex = 0;
  int _onSaveIndex = 0;
  var trips = ['dummy'];

  List _pages = [
    Text("Home"),
    //Text("Search"),
    Text("Trip"),
    Text("Trip Event Details"),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });

  }

  void _onSave(String tripText) {
    setState(() {
      _onSaveIndex+=1;
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
      appBar: PreferredSize( //add this to actually increase size of top bar and place appbar
        preferredSize: Size.fromHeight(120.0),

        child: AppBar(title: Text(widget.title, style: TextStyle(fontFamily: 'open_sans'),),
          //titleSpacing: ,
          centerTitle: true,
          backgroundColor: Colors.lime[900],
          shape: RoundedRectangleBorder( borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(30)
          )
          ),

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // do something`
              },
            )
          ],),
      ),
      //Container(height: 100,color: Colors.cyan,)


      body: ListView(
        children: [
          for (var i=1; i<=_onSaveIndex;i++)

            Card( child: ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text(trips[i]),
              subtitle: Text(trips[i]),
              trailing: Icon(Icons.more_vert),
            ))
        ]
        ,)
      ,
      //Center(child: _pages[_selectedTabIndex],),

      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addtrip(_onSave),
            ),);
        }, //
        backgroundColor: Colors.lime[800],
        splashColor: Colors.lime,
        //tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}