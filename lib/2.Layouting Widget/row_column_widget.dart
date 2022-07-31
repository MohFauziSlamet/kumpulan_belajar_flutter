// TODO: catatan
// pengertian Column dan Row
// column : untuk menyusun lebih dari 1 widget ke arah vertikal (Atas Bawah)
// row : untuk menyusun lebih dari 1 widget ke arah horizontal (Kiri kanan)
// pengertian MainAxisAlignment dan propertinya
// pengertian CrossAxisAlignment dan propertinya

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Belajar membuat row dan column'),
          ),
          body: ListView(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                        ContainerItem(
                          warna: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class ContainerItem extends StatelessWidget {
  Color warna;

  ContainerItem({
    Key? key,
    required this.warna,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
      color: warna,
      child: Center(
        child: Text('Kotak 3'),
      ),
    );
  }
}

// tutorial pak erico
class RowColumn extends StatelessWidget {
  const RowColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Container(color: Colors.blue, child: const Text('Text 1')),
        Container(color: Colors.red, child: const Text('Text 2')),
        Container(color: Colors.yellowAccent, child: const Text('Text 3')),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(color: Colors.purple[200], child: const Text('text 4')
                // FlutterLogo(
                //   size: 100,
                // )
                ),
            Container(
              child: const Text(
                'text 5',
                // style: TextStyle(fontSize: 16),
              ),
              color: Colors.amber,
            ),
            Container(color: Colors.blue[100], child: const Text('text 6')
                // FlutterLogo(
                //   size: 100,
                // )
                ),
          ],
        )
      ],
    );
  }
}
