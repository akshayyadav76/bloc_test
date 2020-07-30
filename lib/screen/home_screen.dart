import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc2/api_bloc.dart';
import '../bloc2/api_events.dart';
import '../bloc2/api_state.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var objBloc = BlocProvider.of<ApiBloc2>(context);
     Fetch(objBloc);
    return Scaffold(
      appBar: AppBar(title: Text("api bloc 2"),
      actions: <Widget>[
        Text("0",textAlign: TextAlign.center,style: TextStyle(fontSize: 25))
      ],),
      body: BlocBuilder<ApiBloc2,ApiState>(
        bloc: objBloc,
         builder: (context,mystate){
           if(mystate.dataCheck == Check.Loading){
             return Center(child:CircularProgressIndicator());
           }else if(mystate.dataCheck == Check.Sucss){
             Text(mystate.data[1])
           }
           
         }
      )
    );
  }
}