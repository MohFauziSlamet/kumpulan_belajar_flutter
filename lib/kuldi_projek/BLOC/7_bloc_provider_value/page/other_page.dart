import 'package:belajar_flutter/kuldi_projek/BLOC/7_bloc_provider_value/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${myCounter.state}",
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
