import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/theme_cubit.dart';
import '../routes/app_routers.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      bloc: context.read<ThemeCubit>(),
      builder: (context, state) {
        return MaterialApp(
          theme: state
              ? ThemeData.light(useMaterial3: true)
              : ThemeData.dark(useMaterial3: true),
          onGenerateRoute: (settings) => MyRouters().appsRouters(settings),
        );
      },
    );
  }
}
