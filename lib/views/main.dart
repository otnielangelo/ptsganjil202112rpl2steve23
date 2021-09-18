import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ptsganjil202112rpl2steve23/views/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => ListPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.amberAccent[700],
        child: Image.asset("yummy.jpg"),
      width: 400,
      height: 300,
    );
  }
}