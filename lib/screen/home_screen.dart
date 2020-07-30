import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("api bloc 2"),
      actions: <Widget>[
        Text("0",textAlign: TextAlign.center,style: TextStyle(fontSize: 25))
      ],),
      body: Column(
        
      ),
    );
  }
}