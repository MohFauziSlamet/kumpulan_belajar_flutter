import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Image Widget"),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.purple,
                    Colors.blue,
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Barochatul Mauludy',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.lightGreen,
                      decorationStyle: TextDecorationStyle.dashed,
                      decorationThickness: 2,
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(3),
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage('assets/mauludy.jpg'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(3),
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage('assets/mauludy.jpg'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(3),
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage('assets/mauludy.jpg'),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(3),
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage('assets/mauludy.jpg'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(3),
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage('assets/mauludy.jpg'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(3),
                        width: 100,
                        height: 150,
                        child: const Image(
                          image: AssetImage('assets/mauludy.jpg'),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//