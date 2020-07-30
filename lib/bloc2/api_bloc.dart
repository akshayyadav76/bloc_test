import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc2/api_events.dart';
import '../bloc2/api_state.dart';


class ApiBloc2 extends Bloc<ApiEvents,ApiState>{

  ApiBloc2(ApiState initialState) : super(initialState);


  @override
  Stream<ApiState> mapEventToState(event)async* {
   if(event is Loading){
      yield state;
   }
    throw UnimplementedError();
  }
}