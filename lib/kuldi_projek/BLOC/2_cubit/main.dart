import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Apps"),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///* counter.
          StreamBuilder(
            stream: myCounter.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ConditionalSwitch.single(
                context: context,
                valueBuilder: (context) => snapshot.connectionState,
                caseBuilders: {
                  ConnectionState.waiting: (context) => const Center(
                        child: Text(
                          "Loading.....",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                },
                fallbackBuilder: (context) => Center(
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              );
            },
          ),

          ///* button increment decrement
          Row(
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
          ),
        ],
      ),
    );
  }
}
