import "../../model/api_facts.dart";

enum LoadingState{none,loading,error}

class ApiState{
  List<ApiFacts>apiData =[];
  int get apiFactsLength =>apiData.length;

  LoadingState  load = LoadingState.loading;

  int totalRead = 0;
  String get totalReadGet =>totalRead.toString();

  ApiState.initial();

 ApiState(ApiState currentState){
   this.apiData = currentState.apiData;
   this.load = currentState.load;
    this.totalRead = currentState.totalRead;
 }
}