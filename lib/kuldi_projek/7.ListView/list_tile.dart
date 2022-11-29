import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Latihan ListTile"),
        ),
        body: ListView(
          children: [
            ListTile(
              // jarak dengan sisi luar keseluruhan
              contentPadding: const EdgeInsets.all(20),
              // title merupakan judul (atau konten yang paling menonjol)
              title: const Text("Barochatul Mauludy"),

              // title merupakan subjudul (atau konten yang menerangkan dari judul)
              subtitle: const Text("M Fauzi Slamet"),
              // leading bisa diisi dengan icon, maupun widget lainnya
              leading: Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: const Image(
                    image: AssetImage("assets/mauludy.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // trailing , biasanya diisi dengan waktu , maupun icon hapus
              trailing: const Text("10.00 am"),
            ),
            // Divider bisa difungsikan sebagai pembatas antar listtile
            const Divider(
              thickness: 5,
            ),
            GestureDetector(
              // menambhkan methode ketika akan dinavigasikan ke page lainnya
              onTap: () {},
              child: const ListTile(
                contentPadding: EdgeInsets.all(20),
                // title merupakan judul (atau konten yang paling menonjol)
                title: Text("Barochatul Mauludy"),

                // title merupakan subjudul (atau konten yang menerangkan dari judul)
                subtitle: Text("M Fauzi Slamet"),
                // leading bisa diisi dengan icon, maupun widget lainnya
                leading: CircleAvatar(
                  radius: 29,
                  backgroundImage: AssetImage("assets/mauludy.jpg"),
                ),
                trailing: Text("10.00 am"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
