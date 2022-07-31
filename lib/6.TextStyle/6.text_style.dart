import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Text Style'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              //
              Text(
                'Namanya Barochatul Mauludy',
                style: TextStyle(
                  fontFamily: 'FiraCode',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,

                  // membuat garis tengah
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.amber,

                  // membuat garis putus putus
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationThickness: 5,
                  fontSize: 30,
                  letterSpacing: 2,
                  wordSpacing: 5,
                ),
                textAlign: TextAlign.center,
              ),

              //
              Text(
                'Namanya Barochatul Mauludy',
                style: TextStyle(
                  fontFamily: 'FiraCode',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  color: Colors.lightBlue,

                  // membuat garis dibawah
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.amber,

                  // membuat garis motif lurus
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 5,
                  fontSize: 30,
                  letterSpacing: 5,
                  wordSpacing: 7,
                ),
                textAlign: TextAlign.center,
              ),

              //
              Text(
                'Namanya Barochatul Mauludy',
                style: TextStyle(
                  fontFamily: 'FiraCode',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,

                  // membuat garis di atas
                  decoration: TextDecoration.overline,
                  decorationColor: Colors.amber,

                  // membuat garis dengan motif gelombang
                  decorationStyle: TextDecorationStyle.wavy,
                  decorationThickness: 5,
                  fontSize: 30,
                  letterSpacing: 2,
                  wordSpacing: 5,
                ),
                textAlign: TextAlign.center,
              ),

              //
              Text(
                'Namanya Barochatul Mauludy',
                style: TextStyle(
                  fontFamily: 'FiraCode',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,

                  // membuat garis di bawah
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.purple,

                  // membuat motif garis titik titik
                  decorationStyle: TextDecorationStyle.dotted,
                  decorationThickness: 10,
                  fontSize: 30,
                  letterSpacing: 2,
                  wordSpacing: 5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
