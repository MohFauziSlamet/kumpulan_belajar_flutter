import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
        centerTitle: true,
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/other",
          );
        },
        child: const Icon(
          Icons.forward,
          size: 24.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetData(),

          ///* button increment decrement
          ButtonWidget(),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ///* menggambil dari blocprovider langsung.
    // CounterCubit myCounter = BlocProvider.of<CounterCubit>(context);

    ///* bisa juga mengambil dari context.
    CounterCubit myCounter = context.read<CounterCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => myCounter.decrement(),
          icon: const Icon(
            Icons.remove,
            size: 24.0,
          ),
        ),
        IconButton(
          onPressed: () => myCounter.increment(),
          icon: const Icon(
            Icons.add,
            size: 24.0,
          ),
        ),
      ],
    );
  }
}

class WidgetData extends StatelessWidget {
  const WidgetData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = BlocProvider.of<CounterCubit>(context);
    return BlocBuilder<CounterCubit, int>(
        bloc: myCounter,
        builder: (context, state) {
          return Center(
            child: Text(
              "${myCounter.state}",
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          );
        });
  }
}
