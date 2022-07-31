import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home nya diubah menjadi DefaultTabController
      // agar dapat diisi dengan tab
      // setelah itu child nya Scaffold
      home: DefaultTabController(
          // length merupakan jumlah tab yang ingin dibuat
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Latihan TabBar"),
              // bottom : tabs , merukapan kumpulan nama atau icon pada tabbar
              // jumlahnya sesuai dengan length yang diisi diatas
              bottom: const TabBar(tabs: <Widget>[
                // tab 1
                Tab(
                  icon: Icon(
                    Icons.comment,
                  ),
                  text: "Comments",
                ),
                // tab 2
                // tab juga dapat diisi dengan Widget apapun
                // misalnya image
                // child dan text pada tab , tidak boleh digunakan secara bersamaan
                Tab(
                  child: Image(image: AssetImage("assets/logo.jpg")),
                ),
                // tab 3
                Tab(
                  icon: Icon(
                    Icons.computer,
                  ),
                ),
                // tab 4
                Tab(
                  text: "News",
                )
              ]),
            ),
            //body disisi dengan tabbarview
            // tabbarview beriisi kumpulan tampilan dari tiap tiap Tab
            // urutannya nomor 1 adalah yang paling atas pada children
            body: const TabBarView(children: [
              Center(
                  child: Text(
                "Ini adalah tab nomor 1",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )),
              Center(
                  child: Text(
                "Ini adalah tab nomor 2",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )),
              Center(
                  child: Text(
                "Ini adalah tab nomor 3",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )),
              Center(
                  child: Text(
                "Ini adalah tab nomor 4",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ))
            ]),
          )),
    );
  }
}
