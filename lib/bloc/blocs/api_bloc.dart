import 'package:bloc/bloc.dart';
import 'package:bloc_test/model/api_facts.dart';
import 'package:flutter/rendering.dart';

import '../events/api_events.dart';
import '../states/api_state.dart';


class ApiBloc extends Bloc<ApiEvents,ApiState>{

  ApiBloc() : super(ApiState.initial());

  @override
  Stream<ApiState> mapEventToState(ApiEvents event)async* {
  final newState = ApiState(state);
    if(event is ApiLoading){
     newState.load =LoadingState.loading;
     yield newState;

     }
     if(event is ApiFetche){
     newState.load =LoadingState.error;
     yield newState;
     
     }
     if(event is ApiSuccess){
     newState.load =LoadingState.none;
     newState.apiData = event.recentApiData;
     yield newState;
     
     }
     if(event is ApiReadIncrement){
     newState.totalRead++;
     yield newState;
     
     }
   
  }

  @override
 void onTransition(Transition transition) {
   print(transition);
   super.onTransition(transition);
  }

 @override
 void onError(Object error, StackTrace stackTrace) {
   print("error $error " " stacktrace $stackTrace");
   super.onError(error, stackTrace);
  }
}