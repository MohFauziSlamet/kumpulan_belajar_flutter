import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../page/home_page.dart';
import '../page/not_found.dart';
import '../page/other_page.dart';

class MyRouters {
  Route appsRouters(RouteSettings settings) {
    switch (settings.name) {
      ///* menjadi initial route
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: context.read<CounterCubit>(),
            child: const HomePage(),
          ),
        );

      case AppRoutes.other:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: context.read<CounterCubit>(),
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

class AppRoutes {
  AppRoutes._();

  ///* Auth
  static const String root = '/';
  static const String other = '/other';
}
