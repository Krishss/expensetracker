import 'package:flutter/material.dart';
import 'package:expensetracker/TripEventLog.dart';
//import 'models/global.dart';
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
      home: MyHomePage(title: 'Expense Tracker...'),
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

  @override
  Widget build(BuildContext context) {
    //Screen UI assembly
    return Scaffold(
      appBar: PreferredSize(
        //add this to actually increase size of top bar and place appbar
        preferredSize: Size.fromHeight(120.0),

        child: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontFamily: 'open_sans'),
          ),
          //titleSpacing: ,
          centerTitle: true,
          backgroundColor: Colors.lime[900],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),

          actions: <Widget>[

          ],
        ),
      ),
      //Container(height: 100,color: Colors.cyan,)

      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            GestureDetector(onTap: (){
              Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TElog(), //set route to homepage
              ),

            );},
              child: Card(
                  child: ListTile(
                    leading: Icon(Icons.radio_button_unchecked),
                    title: Text('Trip location A'),
                  ),
              ),
            ),


          ],
        ),
      ),
      //Center(child: _pages[_selectedTabIndex],),

      floatingActionButton: new FloatingActionButton(
        onPressed: () {}, //
        backgroundColor: Colors.lime[800],
        splashColor: Colors.lime,
        //tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
