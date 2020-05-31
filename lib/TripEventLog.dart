import 'package:flutter/material.dart';
import 'package:expensetracker/HomePage.dart';

void main() => runApp(TElog());

/// This Widget is the main application widget.
class TElog extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('to show notification here'));

void openPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Home(), //set route to homepage
    ),
  );

}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the Trip EVENT LOGGER',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
