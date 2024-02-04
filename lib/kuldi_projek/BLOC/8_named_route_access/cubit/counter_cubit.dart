import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialNumber = 0}) : super(initialNumber);

  int initialNumber;

  ///* state adalah kondisi sekarang , yaitu initialNumber. atau
  ///* nilai yang dikembalikan (int).
  ///* emit , digunakan untuk mengubah state.
  void increment() => emit(state + 1);
  void decrement() => emit((state != 0) ? state - 1 : state);

  ///* untuk memantau setiap perubahan pada state (initialNumber).
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    log("message onChange : $change ");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    log("message onChange : $error || stackTrace : $stackTrace ");
  }
}
