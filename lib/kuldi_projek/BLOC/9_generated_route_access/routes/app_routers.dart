import 'package:belajar_flutter/kuldi_projek/BLOC/9_generated_route_access/cubit/counter_cubit.dart';
import 'package:belajar_flutter/kuldi_projek/BLOC/9_generated_route_access/page/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page/home_page.dart';
import '../page/other_page.dart';

class MyRouters {
  final CounterCubit _counterCubit = CounterCubit();

  Route appsRouters(RouteSettings settings) {
    switch (settings.name) {
      ///* menjadi initial route
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const HomePage(),
          ),
        );

      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const OtherPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
    }
  }
}
