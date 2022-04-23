import 'package:bloc_test/bloc_test.dart';
import 'package:flutterblocpractice/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CoutnerCubit', () {
    CounterCubit counterCubit = CounterCubit();
    setUp(() {});

    tearDown(() {});

    test('CoutnerCubit initial state is CounterState(counter: 0)', () {
      expect(counterCubit.state, CounterState(counter: 0));
    });

    blocTest(
        'CoutnerCubit Stream emits [CounterState(counter: 1)] when CounterState(counter: 2) is added',
        build: () => counterCubit,
        act: (cubit) => counterCubit.increment(),
        expect: () => [CounterState(counter: 1, isIncrement: 1)]);
    blocTest(
        'CoutnerCubit  Stream emits [CounterState(counter: 0)] when CounterState(counter: 1) is removed',
        build: () => counterCubit,
        act: (cubit) => counterCubit.decrement(),
        expect: () => [CounterState(counter: -1, isIncrement: -1)]);
  });
}
