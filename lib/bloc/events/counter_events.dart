
abstract class CounterEvents{}


class IncrementEvent extends CounterEvents{
  int number;
  IncrementEvent(this.number);
}