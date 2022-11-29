import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latian stack'),
        ),
        body: Stack(
          children: [
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.pink[200],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white12,
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.pink[200],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white12,
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.pink[200],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white12,
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.pink[200],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white12,
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.pink[200],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white12,
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.pink[200],
                    )),
              ],
            ),
            ListView(
              children: [
                Column(children: widgets),
              ],
            ),
            Align(
              alignment: const Alignment(0.75, 0.9),
              // x = posisi kiri (-1) , posisi kanan (1) , dan tengah (0) type data double
              // y = posisi atas ( -1) , posisi bawah (1) , dan tengah (0) type data double
              child: ElevatedButton(
                  child: const Text('Tambah'),
                  onPressed: () {
                    setState(() {
                      widgets.add(
                        Text(
                          'Barochatul Mauludy $counter',
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                      counter++;
                    });
                  }),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              // x = posisi kiri (-1) , posisi kanan (1) , dan tengah (0) type data double
              // y = posisi atas ( -1) , posisi bawah (1) , dan tengah (0) type data double
              child: ElevatedButton(
                  child: const Text('Reset'),
                  onPressed: () {
                    setState(() {
                      widgets = [];
                      counter = 1;
                    });
                  }),
            ),
            Align(
              alignment: const Alignment(-0.75, 0.9),
              // x = posisi kiri (-1) , posisi kanan (1) , dan tengah (0) type data double
              // y = posisi atas ( -1) , posisi bawah (1) , dan tengah (0) type data double
              child: ElevatedButton(
                child: const Text('Hapus'),
                onPressed: () {
                  setState(
                    () {
                      widgets.removeLast();
                      counter--;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
