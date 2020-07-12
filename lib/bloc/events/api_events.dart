import 'dart:convert';

import 'package:bloc_test/model/api_facts.dart';
import 'package:http/http.dart'as http;

import '../blocs/api_bloc.dart';


abstract class ApiEvents {}

class ApiFetche extends ApiEvents{
ApiFetche(ApiBloc bloc){
  fetch(bloc);
}

void fetch(ApiBloc bloc) async{
  const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';
  bloc.add(ApiLoading());
  final response = await http.get(_catFactsUrl);
  // if success todo
  if(response.statusCode ==200){
     Map<String, dynamic> decodedItems = json.decode(response.body);
      final catFacts = List.from(decodedItems['all']).map((json) => ApiFacts.fromJson(json)).toList();
      bloc.add(ApiSuccess(catFacts));
  }else{
  print("faild get");
  bloc.add(ApiFaild());
   }
 }
}

class ApiLoading extends ApiEvents{}

class ApiSuccess extends ApiEvents{
 List<ApiFacts>recentApiData;

 ApiSuccess(this.recentApiData);

}

class ApiFaild extends ApiEvents{}

class ApiReadIncrement extends ApiEvents{}

