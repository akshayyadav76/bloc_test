import 'package:flutter/material.dart';
import './counter_page.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import './bloc/blocs/counter_bloc.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(create:(context)=>CounterBloc())
        ],
        child: CounterPage()),
    );
  }
}


