import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // untuk memakai list yang berisi banyak data dan type data beda,
  // bisa menggunakan format key : value
  // disini key bertype string , dan value bertype dynamic
  final List<Map<String, dynamic>> myList = [
    {
      'name': 'Barochatul Mauludy',
      'age': 22,
      'favColor': ['red', 'green', 'blue', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    },
    {
      'name': 'M Fauzi Slamet',
      'age': 25,
      'favColor': ['red', 'green', 'blue', 'grey', 'amber', 'yellow', 'purple'],
    }
  ];

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ID Apps",
          ),
        ),
        body: ListView(
          // memasukan data kedalam widget
          // kita harus memapping data menjadi list
          children: myList.map(
            // paraneter atau variabel pengganti dari myList
            (data) {
              // untuk memakai favColor
              // kita harus pecah menjadi list tunggal, karena favColor merupakan bagian list didalam list.
              // dengan cara dibawa, kita sudah memecah data sementara dari list favColor, list favColor tetap
              // menjadi bagian dari myList. dipecah hanya untuk mengambil datanya saja.
              List myColor = data['favColor'];
              print(myColor);

              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(20),
                color: Colors.grey[350],
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/mauludy.jpg'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // untuk memasukan datanya, kita panggil paraneter / variabel pengganti myList  yaitu data
                              Text("Nama : ${data['name']}"),
                              Text("Usia : ${data['age']}"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // direction ke kiri
                        child: Row(
                          // didalam children , kita mapping lagi , sama kayak yang diatas
                          children: myColor.map(
                            (color) {
                              return Container(
                                width: 100,
                                color: Colors.lightBlue,
                                margin: const EdgeInsets.only(right: 5),
                                child: Text(
                                  color,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
