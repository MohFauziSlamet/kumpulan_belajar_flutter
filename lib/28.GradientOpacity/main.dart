import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Gradient Opacity"),
        ),
        body: Center(
          // ShaderMask digunakan untuk membuat gradasi opacity
          child: ShaderMask(
              // shaderCallback membutuhka fungsi untuk mendapatkan masking nya
              shaderCallback: (rectangle) {
                //LinearGradient berupa colors akan diabaikan warnanya, dan ditambahkan
                // blendMode.dstIn , untuk mengambil opacitynya saja
                // apapun warnanya akan di abaikan
                return const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(
                        Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
              },
              blendMode: BlendMode.dstIn,
              child: const Image(
                  width: 300, image: AssetImage("assets/images/mauludy.jpg"))),
        ),
      ),
    );
  }
}
