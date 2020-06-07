import 'package:flutter/material.dart';
import 'package:expensetracker/HomePage.dart';

void main() {
  runApp(MaterialApp(
    //Creates a whole app ecosystem, All classes written below loads to material app for main
    home: SplashIntro(),
  ));
}

class SplashIntro extends StatefulWidget {
  @override
  _SplashIntroState createState() => _SplashIntroState();
}

class _SplashIntroState extends State<SplashIntro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FlutterLogo(size: 200,),
        )
    );
  }
}
