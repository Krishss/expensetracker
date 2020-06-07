import 'package:flutter/material.dart';

class Addtrip extends StatelessWidget {
  static const String _title = 'Trip Information';
  final Function selectHandler;
  Addtrip(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title,style: TextStyle(fontFamily: 'Georgia', color: Colors.black), ),
            centerTitle:true,
            backgroundColor: Colors.green[500]),
        body: MyStatefulWidget(selectHandler),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
 // MyStatefulWidget({Key key}) : super(key: key);
  final Function selectHandler;
  MyStatefulWidget(this.selectHandler);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(this.selectHandler);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final Function selectHandler;
  String _name;
  _MyStatefulWidgetState(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Trip Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }

              return null;
            },
            onChanged: (String value){
              setState(() {
                _name= value;
              });
                //_name=value;
               // print(_name);

            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: RaisedButton(
              splashColor: Colors.greenAccent,
              color: Colors.lime[200],
              onPressed: ()
              {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {

                  this.selectHandler(_name);
                }
              },
              child: Text('Submit'),
            ),
          ),




        ],
      ),
    );
  }
}
