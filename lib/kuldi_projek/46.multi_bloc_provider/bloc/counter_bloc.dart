import 'package:flutter_bloc/flutter_bloc.dart';

class CounterMultiBloc extends Cubit<int> {
  CounterMultiBloc() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit((state != 0) ? state - 1 : state);
}
