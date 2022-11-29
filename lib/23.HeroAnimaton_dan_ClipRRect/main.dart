import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
    );
  }
}

// ignore: camel_case_types
class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[400],
          title: const Text(
            "Latihan Hero Animation",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      backgroundColor: Colors.lightGreen[300],
      // GestureDetector digunakan untuk memberi event tap pada gambar
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (contex) {
            return const secondPage();
          }));
        },
        // ClipRRect adl widget yang harus dibungkus oleh widget Hero
        // karena yang akan di animasikan adalah widget didalam ClipRRect
        child: Hero(
          // tag , digunakan sbg penanda yang mau dianimasikan
          // point yang dianimasikan adl image nya
          // tag wajib ada 2, yaitu di awal dan di akhir
          // tag akhir disini berada pada secondPage
          tag: 'pp',

          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage("assets/images/mauludy.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pinkAccent[200],
          title: const Text(
            "Latihan Hero Animation",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      backgroundColor: Colors.pink[300],
      body: Center(
        child: Hero(
          // tag pp sebagai penanda akhir
          tag: 'pp',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage("assets/images/mauludy.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
