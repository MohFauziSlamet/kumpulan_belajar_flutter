import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) {
          return Counter();
        },
        child: homeScreen(),
      ),
    );
  }
}

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);

    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review State Management Provider"),
      ),

      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // karena text ini akan berubah sesuai dengan apa yang diklik
          // maka text ini memerlukan data ,
          // disini kita akan menggunakan consumer , agar always listen
          Consumer<Counter>(builder: (context, value, child) {
            return Text(
              value.counter.toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            );
          }),

          //jarak
          const SizedBox(
            height: 20,
          ),

          // icon button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: counter.minus,
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                onPressed: counter.add,
                icon: const Icon(
                  Icons.add,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void add() {
    _counter += 1;

    notifyListeners();
  }

  void minus() {
    if (_counter != 0) {
      _counter -= 1;
    }

    notifyListeners();
  }
}
