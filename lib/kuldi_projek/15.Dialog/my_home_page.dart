// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = 'Belum ada data yang dinput';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Dialog Alert"),
        centerTitle: true,
      ),

      // body
      body: Center(
        child: Text(
          data,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),

      // floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // menampilkan dialog dengan perintah show dialog
          showDialog(
            context: context,
            builder: (context) {
              // Widget untuk menampilkan dialognya
              // showDialog dan AlertDialog merupakan satu kesatuan
              return AlertDialog(
                // judul alert
                title: const Text("Confirm"),

                // menambahkan keterangan detail
                content: const Text("Apakah anda yakin ingin menghapus ini ?"),

                // menambahkan action , seperti tombol  yes or no
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // membuang tampilan alert , atau mengangkat alert
                        Navigator.of(context).pop("INI ADALAH NO");
                        print("klik no");
                        data = "FALSE";
                      });
                    },
                    child: const Text("NO"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop("INI ADALAH YES");
                        print("klik YES");
                        data = "True";
                      });
                    },
                    child: const Text("YES"),
                  ),
                ],
              );
            },
            // penambahan then , untuk menampilkan apa yang ingin ditampilkan setelah di pop
          ).then((value) {
            return print(value);
          });

          print("Telah diklik");
        },
        child: const Icon(Icons.remove),
      ),

      // mengatur tata letak button dengan floatingActionButtonLocation
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
