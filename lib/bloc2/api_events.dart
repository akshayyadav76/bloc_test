import 'package:bloc_test/bloc2/api_state.dart';

import './api_bloc.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import '../model/api_facts.dart';

abstract class ApiEvents {}

 class Events extends ApiEvents{

 }
 class Fetch extends ApiEvents{

   Fetch(ApiBloc2 bloc){
     resolvHttp(bloc);
   }

   void resolvHttp(ApiBloc2 bloc)async{
       const _url = 'https://cat-fact.herokuapp.com/facts';
       bloc.add(Loading());
      var response = await http.get(_url);
      if(response.statusCode ==200){
     Map<String, dynamic> decodedItems = json.decode(response.body);
      final catFacts = List.from(decodedItems['all']).map((json) => ApiFacts.fromJson(json)).toList();
      bloc.add(ApiSuccess(catFacts));
     }     
   }
 }

 class Loading extends ApiEvents{
  
 }

 class ApiSuccess extends ApiEvents{
   List<ApiFacts> seeData;
   ApiSuccess(this.seeData);
   
 }