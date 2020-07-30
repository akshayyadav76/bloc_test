import 'package:flutter/material.dart';

import './screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc2/api_bloc.dart';
import './bloc2/api_state.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context)=>ApiBloc2(ApiState()),
        child: HomeScreen())
    );
  }
}


