part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counter;
  int isIncrement;
  CounterState({required this.counter, this.isIncrement = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [counter, isIncrement];
}
