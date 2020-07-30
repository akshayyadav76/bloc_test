import './api_bloc.dart';

abstract class ApiEvents {}

 class Events extends ApiEvents{

 }
 class Fetch extends ApiEvents{
   Fetch(ApiBloc2 bloc);

   void resolvHttp(bloc){
     
   }
  static const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';
  
  

 }

 class Loading extends ApiEvents{
  
 }