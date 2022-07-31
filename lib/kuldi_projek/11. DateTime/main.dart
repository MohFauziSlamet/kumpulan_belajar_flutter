import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        appBar: AppBar(
          title: Text("Lathian Date Time"),
        ),
        body: Center(
          child: Text(
            DateFormat.yMMMEd().add_Hms().format(
                  DateTime.now(),
                ),
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
// yMMMEd adalah format dari tampilannya , lihat di dokumentasi
// DateTime.now adalah waktu sekarang
// untuk pemformatan datetime
// https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html