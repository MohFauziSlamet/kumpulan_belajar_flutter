import 'bloc/counter_bloc.dart';
import 'bloc/them.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/multi_bloc_listener.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData dark = ThemeData.dark();

  ThemeData light = ThemeData.light();

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterMultiBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeMultiBloc(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CounterMultiBloc, int>(
            listener: (context, state) {
              if (state % 1 == 0) {
                setState(() {
                  isDark = !isDark;
                });
              }
            },
          ),
        ],
        child: BlocBuilder<ThemeMultiBloc, bool>(
          builder: (context, state) => MaterialApp(
            theme: (state == isDark) ? light : dark,
            home: const HomeMultiBlocListener(),
          ),
        ),
      ),
    );
  }
}
