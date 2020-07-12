  
import 'package:bloc_test/model/api_facts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/states/api_state.dart';
import "../bloc/blocs/api_bloc.dart";
import '../bloc/events/api_events.dart';
import '../screens/api_fact_screen.dart';

class ApiFactsScreen extends StatefulWidget {
  const ApiFactsScreen({
    Key key,
    @required this.apiFactsBloc,
  }) : super(key: key);

  final ApiBloc apiFactsBloc;

  @override
  _ApiFactsScreenState createState() => _ApiFactsScreenState();
}

class _ApiFactsScreenState extends State<ApiFactsScreen> {

  @override
  void initState() {
    super.initState();
    // start the fetching of facts
    //FetchCatFacts(widget.catFactsBloc);
    ApiFetche(widget.apiFactsBloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat facts app'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: BlocBuilder<ApiBloc, ApiState>(
              bloc: widget.apiFactsBloc,
              builder: (context, catFactState) {
                return Text(
                  'posts read: ${catFactState.totalRead}',
                  style: Theme.of(context).primaryTextTheme.button,
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        bloc: widget.apiFactsBloc,
        builder: (context, catFactState) {
          if (catFactState.load == LoadingState.loading)
            return Center(child: CircularProgressIndicator());
          else if (catFactState.load == LoadingState.none)
            return ListView.builder(
              itemCount: catFactState.apiData.length,
              itemBuilder: (context, index) {
                final catFact = catFactState.apiData[index];
                return CatFactsTile(catFact: catFact);
              },
            );
          else
            return Center(child: Text('There was an error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ApiFetche(widget.apiFactsBloc),
      ),
    );
  }
}

class CatFactsTile extends StatelessWidget {
  const CatFactsTile({
    Key key,
    @required this.catFact,
  }) : super(key: key);

  final ApiFacts catFact;


  @override
  Widget build(BuildContext context) {
   // final catFactsBloc = BlocProvider.of<ApiBloc>(context);
    return Text(catFact.text);
    //  ListTile(
    //   onTap: () {
    //     catFactsBloc.add(ApiReadIncrement());
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => ApiFactScreen(apiFacts: catFact,),
    //       ),
    //     );
    //   },
    //   title: Text(catFact.userName),
    //   subtitle: Text(catFact.text),
    // );
  }
}