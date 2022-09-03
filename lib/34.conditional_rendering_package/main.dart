// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) => _counter % 2 == 0,
              widgetBuilder: (BuildContext context) {
                return Column(
                  children: const <Widget>[
                    Text(
                      'The number is even.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Icon(
                      Icons.check,
                      size: 60.0,
                      color: Colors.green,
                    ),
                  ],
                );
              },
              fallbackBuilder: (BuildContext context) {
                return Column(
                  children: const <Widget>[
                    Text(
                      'The number is not even.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Icon(
                      Icons.close,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
