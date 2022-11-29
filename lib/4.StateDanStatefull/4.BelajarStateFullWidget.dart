// setstate berfungsi , mengubah tampilan sesuai dengan keadaan saat ini

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
  // methode untuk mengisi number
  int number = 0;
  void tekanTombol() {
    setState(
      () {
        // fungsi dari setstate adalah untuk merefresh tampilan ketika ada perubahan
        number = number + 1;
      },
    );
  }

// method untuk membalikkan number menjadi nol lagi
  void resetNumber() {
    setState(
      () {
        number = 0;
      },
    );
  }

  void kurangiNumber() {
    setState(
      () {
        if (number != 0) {
          number--;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Belajar StateFull Widget'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.deepPurple,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.lightBlue,
                ),
                margin: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.lightGreen,
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.yellowAccent,
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.pinkAccent[100],
                      ),
                      margin: const EdgeInsets.all(20),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    number.toString(),
                    style: TextStyle(
                        fontSize: 14 + number.toDouble(), color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: tekanTombol,
                    child: const Text('Tombol Tambah'),
                  ),
                  ElevatedButton(
                    onPressed: kurangiNumber,
                    child: const Text('Tombol kurangi'),
                  ),
                  ElevatedButton(
                      onPressed: resetNumber,
                      child: const Text('Reset Number')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
