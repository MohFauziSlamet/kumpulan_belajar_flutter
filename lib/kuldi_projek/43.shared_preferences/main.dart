import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool isDark = false;

  void remove() {
    setState(() {
      if (counter != 0) {
        counter--;
      }
    });
  }

  void add() {
    setState(() {
      counter++;
    });
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
  );

  changeThemes() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? dark : light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan shared preferences'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Angka saat ini adalah : ${counter.toString()}",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: remove,
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: add,
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: changeThemes,
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
