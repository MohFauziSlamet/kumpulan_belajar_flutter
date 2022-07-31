import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // list off tab
  List<Tab> myTab = const [
    Tab(
      text: "tab 1",
      icon: Icon(
        Icons.access_alarms_outlined,
      ),
    ),
    Tab(
      text: "tab 2",
      icon: Icon(
        Icons.access_alarms_outlined,
      ),
    ),
    Tab(
      text: "tab 3",
      icon: Icon(
        Icons.access_alarms_outlined,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        // length: 3 , dapat kita ganti menjadi myTab.length
        length: myTab.length,
        //initialIndex digunakan untuk menetapkan default tab
        // ketika aplikasi pertama kali dijalankan pada tab mana
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[400],
            centerTitle: true,
            title: const Text(
              "Latihan TabBar",
              style: TextStyle(color: Colors.amber),
            ),
            bottom: PreferredSize(
              // untuk ukuran tinggi tab bar
              preferredSize: const Size.fromHeight(50),
              child: TabBar(
                // indicatorColor: Colors.purple,
                // indicatorWeight: 5,
                // indicatorPadding: EdgeInsets.all(5),
                //indicator ini digunakan untuk mencustom tampilan tabbar,
                // sehingga indicatorColor dll , akan di abaikan
                indicator: const BoxDecoration(
                  // warna activ tabbar
                  gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  // indicator activ tabbar
                  border: Border(
                    bottom: BorderSide(color: Colors.green, width: 10),
                  ),
                ),
                // memberikan warna label pada semua tab
                labelColor: Colors.black54,
                // memberikan warna pada tab yang tidak terselect
                unselectedLabelColor: Colors.white60,
                // memberikan style pada activ tabbar
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                // memberikan style pada tidak  activ tabbar
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                tabs: myTab,
              ),
            ),
          ),
          // untuk isi tiap tiap dari tab bar
          body: const TabBarView(
            children: [
              Center(
                child: Text(
                  "Tabbar 1",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  "Tabbar 2",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  "Tabbar 3",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
