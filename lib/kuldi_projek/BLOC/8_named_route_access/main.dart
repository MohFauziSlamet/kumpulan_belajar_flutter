import 'package:belajar_flutter/kuldi_projek/BLOC/7_bloc_provider_value/cubit/counter_cubit.dart';
import 'package:belajar_flutter/kuldi_projek/BLOC/8_named_route_access/page/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../7_bloc_provider_value/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomePage(),
            ),
        "/other": (context) => BlocProvider.value(
              value: _counterCubit,
              child: const OtherPage(),
            ),
      },
    );
  }
}
