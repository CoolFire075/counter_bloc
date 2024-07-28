import 'package:counter_bloc/features/counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment() {
    emit(
      CounterState(counter: state.counter + 1),
    );
  }

  void decrement() {
    emit(
      CounterState(counter: state.counter - 1),
    );
  }
}