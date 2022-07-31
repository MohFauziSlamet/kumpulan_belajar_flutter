import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // list sebagai tempat penampung data
  List<Widget> widgets = [];

  // index nilai awal data
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Belajar List dan List View'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Tambah Data',
                    ),
                    onPressed: () {
                      setState(
                        () {
                          widgets.add(
                            Text(
                              'Data ke - ' + counter.toString(),
                              style: const TextStyle(fontSize: 35),
                            ),
                          );
                          counter++;
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Hapus Data'),
                    onPressed: () {
                      setState(
                        () {
                          widgets.removeLast();
                          counter--;
                        },
                      );
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widgets,
              )
            ],
          ),
        ),
      ),
    );
  }
}
