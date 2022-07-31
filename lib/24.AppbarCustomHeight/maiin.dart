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
      home: Scaffold(
        //untuk mengubah size pada appbar
        // kita harus bungkus dengan widget PreferredSize
        // custom size nya bisa lebih besar maupun lebih kecil
        appBar: PreferredSize(
          // lalu kita pasang PreferredSize
          preferredSize: const Size.fromHeight(100),
          // kita juga bisa mengcustom tata letak dari penulisan appbar
          // dengan cara memanfaatkan yang namanya flexibel space pada widget appBar
          // cara nya kita ganti appBar dengan widget flexibelspace
          // didalam flexibelspace bisa diisi dengan widget apapun, tidak hanya text
          child: AppBar(
            backgroundColor: Colors.amber[200],
            // title: const Text(
            //   "Appbar with custom height",
            //   style: TextStyle(color: Colors.grey),
            // ), kita non aktifkan dulu appbar nya kita ubah ke flexibelspace
            flexibleSpace: Align(
              alignment: const Alignment(1, 1),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  "Appbar with custom height",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
