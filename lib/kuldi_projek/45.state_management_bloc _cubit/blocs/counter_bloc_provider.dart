import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocProvider extends Bloc<String, int> {
  int get counter => _counter;
  int _counter = 0;

  CounterBlocProvider() : super(0) {
    on<String>(
      (event, emit) {
        if (event == 'add') {
          emit(_counter++);
        } else if (event == 'minus') {
          if (_counter != 0) {
            emit(_counter--);
          }
        }
      },
    );
  }
}
