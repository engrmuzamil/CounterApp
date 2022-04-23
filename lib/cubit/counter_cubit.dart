import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment() {
    emit(CounterState(counter: state.counter + 1, isIncrement: 1));
  }

  void decrement() {
    emit(CounterState(counter: state.counter - 1, isIncrement: -1));
  }
}
