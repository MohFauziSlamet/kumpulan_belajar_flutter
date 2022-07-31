import 'package:flutter/material.dart';

/* 
Catatan:
// Leding : memberikan icon pojok kiri appBar
// action : memberikan icon pojok kanan appBar (boleh lebih 1 widget)
// debugShowCheckedModeBanner: false, (pada MaterialApp)
// -> digunakan untuk menghilangkan logo debug   
// -> jika bernilai true , maka logo akan muncul
// style : TextStyle -> digunakan untuk mendekorasi font , sepeerti ukuran ,
// warna , style , fontSize , fontStyle , fontWeight , 

*/
class SoalHelloWorldCustom extends StatelessWidget {
  const SoalHelloWorldCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        leading: const FlutterLogo(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Hello world',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
