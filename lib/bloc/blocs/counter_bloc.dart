import 'package:bloc/bloc.dart';
import '../events/counter_events.dart';

class CounterBloc extends Bloc<CounterEvents,int>{

  CounterBloc() : super(0);
 //int get myState =>0;
 

  @override
  Stream<int> mapEventToState(CounterEvents event) async*{
    if(event is IncrementEvent){
      yield state + event.number;
    }
   // throw UnimplementedError();
  }

  void increment(int number){
    this.add(IncrementEvent(number));
  }

}