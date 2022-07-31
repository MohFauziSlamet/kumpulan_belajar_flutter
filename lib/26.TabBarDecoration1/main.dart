import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TabBar myTabbar = const TabBar(
      // mengubah warna indicator
      // indicatorColor: Colors.purple,

      // untuk mengubah tata letak indicatorColor maka kita harus ubah ke indicator saja
      // dan penggunaan indicator tidak boleh bersamaan dengann indicatorColor
      // indicator bertype decoration , jadi bisa menggunakan BoxDecoration
      indicator: BoxDecoration(
        color: Colors.amber,
        border: Border(
            top: BorderSide(
          width: 5.0,
          color: Colors.grey,
        )),
      ),
      tabs: <Widget>[
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
        // child yang berisi widget dan text pada tab , tidak boleh digunakan secara bersamaan

        Tab(
          icon: Icon(
            Icons.computer,
          ),
          text: "Computers",
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home nya diubah menjadi DefaultTabController
      // agar dapat diisi dengan tab
      // setelah itu child nya Scaffold
      home: DefaultTabController(
          // length merupakan jumlah tab yang ingin dibuat ( length = 2)
          // jika menggunakan List, seperti myTabbar, maka bisa diubah menjadi myTabbar.tabs.length
          length: myTabbar.tabs.length,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue[400],
                title: const Center(child: Text("Latihan TabBar")),
                // bottom : tabs , merukapan kumpulan nama atau icon pada tabbar
                // jumlahnya sesuai dengan length yang diisi diatas
                bottom: PreferredSize(
                    //menambahkan tinggi dari tabbar
                    preferredSize:
                        Size.fromHeight(myTabbar.preferredSize.height),
                    // untuk menambahkan bg pada tabbar, kita bungkus dulu dengan Container
                    // karena tabbar mengimplement PreferredSize , maka si Container wajib dibungkus dengan
                    // PreferredSize juga
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.purpleAccent,
                                  Colors.pinkAccent
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: myTabbar))),
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
            ]),
          )),
    );
  }
}
