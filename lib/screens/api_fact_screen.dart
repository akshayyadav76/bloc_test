import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "../model/api_facts.dart";
import '../bloc/blocs/api_bloc.dart';
import '../bloc/states/api_state.dart';

class ApiFactScreen extends StatelessWidget {

  const ApiFactScreen({
    Key key,
    @required this.apiFacts,
  }) : super(key: key);

  final ApiFacts apiFacts;

  @override
  Widget build(BuildContext context) {
    final apiFactsBloc = BlocProvider.of<ApiBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(apiFacts.userName),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Total amount of posts read: '),
              BlocBuilder<ApiBloc, ApiState>(
                bloc: apiFactsBloc,
                builder: (context, catFactState) {
                  return Text(catFactState.totalReadGet);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Total amount of posts: '),
              BlocBuilder<ApiBloc, ApiState>(
                bloc: apiFactsBloc,
                builder: (context, catFactState) {
                  return Text(catFactState.apiFactsLength.toString());
                },
              ),
            ],
          ),
          SizedBox(height: 42),
          Text(apiFacts.text),
        ],
      ),
    );
  }
}