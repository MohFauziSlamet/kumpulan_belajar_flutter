import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      body: Container(
        margin: const EdgeInsets.all(30),
        color: Colors.grey,
        width: widthLebar,
        height: bodyHeightApp * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            MyContainer(),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  // setelah menggunakan LayoutBuilder , kita tidak mengambil
  // tinggi dan lebar layar.
  //  melainkan lebar dari widget parent nya
  // final double widthApp;

  // untuk mengambil tinggi dan lebar parent , kita menggunakan constraints

  const MyContainer(
      // this.widthApp,
      );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double tinggiParent = constraints.maxHeight;
        double lebarParent = constraints.maxWidth;
        print('Lebar parent : ' "$lebarParent");
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // jika height tidak diiisi , maka secara otomatis akan mengambil height maksimal
              // dari parent nya row. yaitu containe grey
              // hal ni karena row mengambil maks height pada parent nya

              height: tinggiParent * 0.7,
              // width: constraints.maxWidth * 0.25,
              width: 120,

              color: Colors.blue[100],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: tinggiParent * 0.8,
              width: 120,
              color: Colors.blue[100],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: tinggiParent * 0.9,
              width: 120,
              color: Colors.blue[100],
            )
          ],
        );
      },
    );
  }
}
