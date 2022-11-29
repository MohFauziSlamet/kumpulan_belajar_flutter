import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Color> myColor = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.amber
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan Listview"),
        ),
        body: ListView.separated(
          // itemCount jumlah list yang mau dibuat
          itemCount: myColor.length,
          // itemBuilder, membuat apa yang ingin ditampilkan
          itemBuilder: (context, index) {
            return Container(
              height: 300,
              width: 300,
              color: myColor[index],
            );
          },
          // separatorBuilder merupakan jarak antar listview
          // dia sama seperti itemBuilder, membutuhkan fungsi yang memiliki
          // 2 argumen
          // separatorBuilder ini dapat berisi sebuah container,
          // didalam container juda dapat berisi widget lain , seperti text
          separatorBuilder: (context, index) {
            // return Container(
            //     margin: EdgeInsets.only(top: 5, bottom: 5),
            //     height: 20,
            //     child: Text(
            //       "Ini adalah jarak antar listview",
            //       textAlign: TextAlign.center,
            //     ));

            // selain container , ada lagi widget divider sebagai jaraknya
            return const Divider(
              thickness: 5,
              // endIndent: 10,
              // indent: 5,
              height: 100,
            );
          },
        ),
      ),
    );
  }
}
