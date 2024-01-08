import 'package:belajar_flutter/kuldi_projek/BLOC/7_bloc_provider_value/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../7_bloc_provider_value/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///* jika blockProvider tidak di tempatkan di atas material ,
    ///* maka saat , pindah route , class tujuan harus di bungkus dengan blockPorvider.value.
    // return MaterialApp(
    //   theme: ThemeData(
    //     useMaterial3: true,
    //   ),
    //   home: BlocProvider(
    //     create: (context) => CounterCubit(),
    //     child: const HomePage(),
    //   ),
    // );

    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
