import './api_bloc.dart';

abstract class ApiEvents {}

 class Events extends ApiEvents{

 }
 class Fetch extends ApiEvents{

   Fetch(ApiBloc2 bloc){
     resolvHttp(bloc);
   }

   void resolvHttp(ApiBloc2 bloc){
       const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';
       bloc.add(Loading());
       
   }
 
  
  

 }

 class Loading extends ApiEvents{
  
 }