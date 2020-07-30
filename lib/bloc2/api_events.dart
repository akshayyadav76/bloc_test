import './api_bloc.dart';
import 'package:http/http.dart'as http;

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
      


       
   }
 
  
  

 }

 class Loading extends ApiEvents{
  
 }