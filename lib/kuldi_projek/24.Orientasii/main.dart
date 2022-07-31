import 'package:flutter/material.dart';
// import 'package:get/get.dart';

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
    //
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;

    // mendapatkan tinggi app bar
    final myAppBar = AppBar(
      title: const Text(
        "Latihan Constraint",
      ),
      centerTitle: true,
    );

    // tinggi body
    final bodyHeightApp = heightApp -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    var widthLebar = widthApp * 0.9;
    return Scaffold(
      appBar: myAppBar,
      body: Align(
        alignment: Alignment.topCenter,
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Container(
                margin: const EdgeInsets.all(30),
                color: Colors.grey,
                width: widthLebar,
                height: bodyHeightApp * 0.4,
              );
            }
            return Container(
              margin: const EdgeInsets.all(30),
              color: Colors.green,
              width: widthLebar,
              height: bodyHeightApp * 0.4,
            );
          },
        ),
      ),
    );
  }
}
