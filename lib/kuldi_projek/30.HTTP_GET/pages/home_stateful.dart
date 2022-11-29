import 'dart:math';

import 'package:belajar_flutter/kuldi_projek/30.HTTP_GET/models/http_stateful.dart';
import 'package:flutter/material.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResponse = HttpStateful();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  (dataResponse.avatar == null)
                      ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                      : dataResponse.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Text(
                (dataResponse.id == null)
                    ? "ID : Belum ada data"
                    : dataResponse.id,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.fullName == null)
                    ? "Belum ada data"
                    : dataResponse.fullName,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.email == null)
                    ? "Belum ada data"
                    : dataResponse.email,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                // menampilkan popup
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Berhasil mengambil data"),
                  ),
                );

                // memanggil connectApi
                HttpStateful.connectApi((1 + Random().nextInt(10)).toString())
                    .then((value) {
                  // setelah kita kirim perintah get ,
                  // data nya tidak langsung dapat , melainkan dalam bentuk future
                  // sebelum data nya dipakai , kita tampung dulu datanya kedalam sebuah variabel bertype
                  // HttpStateful , dengan nama bebas
                  //  selanjut variabel tsb kita isi dari value (data dalam bentuk map )
                  setState(() {
                    dataResponse = value;
                  });
                });
              },
              child: const Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
