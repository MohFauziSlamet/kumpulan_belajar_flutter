// bloc cubit adalah sebuah clas yang mengekstensi sebuah blocbase .
// bloc cubit dilakukan untuk hal hal yang sederhana .

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  // didalam cubit , dia tidak lagi mengirim event , melainkan langsung memanggil sebuah function
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit((state != 0) ? state - 1 : state);

  // emit -> Memperbarui [state] ke [state] yang disediakan.
  // [emit] tidak melakukan apa-apa jika instance telah ditutup atau jika [state] yang di emit
  // sama dengan [state] saat ini.
  // Untuk memungkinkan kemungkinan memberi tahu pendengar tentang keadaan awal,
  // memancarkan keadaan yang sama dengan keadaan awal diperbolehkan selama itu adalah hal pertama yang dipancarkan oleh contoh.
}
