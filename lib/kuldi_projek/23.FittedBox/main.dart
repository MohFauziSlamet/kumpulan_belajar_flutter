import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Latihan Fitted Box",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.lightBlueAccent,
              height: 100,
              width: 400,
              child: const Center(
                child: FittedBox(
                  // widget FittedBox termasuk kategori widget yang responsive
                  child: Text(
                    "Barochatul Mauludy Barochatul Mauludy Barochatul Mauludy",
                    style: TextStyle(
                      fontSize: 30, // ukuran maksimal
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.lightBlueAccent,
              child: const FittedBox(
                // widget FittedBox termasuk kategori widget yang responsive
                child: Image(
                  image: AssetImage(
                    "assets/images/mauludy.jpg",
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
