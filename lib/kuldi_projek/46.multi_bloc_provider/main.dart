import 'package:belajar_flutter/kuldi_projek/46.multi_bloc_provider/bloc/counter_bloc.dart';
import 'package:belajar_flutter/kuldi_projek/46.multi_bloc_provider/bloc/them.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/multi_bloc_provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ThemeData dark = ThemeData.dark();
  ThemeData light = ThemeData.light();

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
      child: BlocBuilder<ThemeMultiBloc, bool>(
        builder: (context, state) => MaterialApp(
          theme: (state) ? dark : light,
          home: HomeMultiBlocProvider(),
        ),
      ),
    );
  }
}
