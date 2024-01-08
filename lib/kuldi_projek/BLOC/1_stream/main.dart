import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Stream<int> stream() async* {
    for (var i = 0; i < 11; i++) {
      await Future.delayed(const Duration(seconds: 1));

      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        actions: const [],
      ),
      body: StreamBuilder(
        stream: stream(),
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
    );
  }
}
