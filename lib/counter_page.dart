import 'dart:developer';

import 'package:bloc_test/bloc/blocs/counter_bloc.dart';
import 'package:bloc_test/bloc/events/counter_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var  counter = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("bloc test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("nuber that incress"),
            BlocBuilder<CounterBloc,int>(
              builder: (context,number){
                return Text(
                '$number',
              );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          counter.increment(2);
        
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}