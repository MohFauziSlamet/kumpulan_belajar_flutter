import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BottomNavigationApp());
}

class BottomNavigationApp extends StatelessWidget {
  const BottomNavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List showWidget = [
    const Center(
      child: Text(
        'Hello Home',
        style: TextStyle(fontSize: 20),
      ),
    ),
    const Center(
      child: Text(
        'Hello Profile',
        style: TextStyle(fontSize: 20),
      ),
    ),
    const Center(
      child: Text(
        'Hello Cart',
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];

  // penambhan late ini , menandakan sebelum di eksekusi
  // index wajib ada data nya
  late int index;

  // initState
  // digunakan untuk menjalankan perintah ketika aplikasi pertama kali dijalankan
  // ia akan merubah index menjadi posisi 0
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Bottom Navigation Bar'),
        centerTitle: true,
      ),
      body: showWidget[index],
      bottomNavigationBar: BottomNavigationBar(
        // menambahkan warna backgroundColor
        backgroundColor: Colors.lightBlue,

        // currentIndex: digunakan untuk menentukan tab mana yang akan
        // ditampilkan ketika pertama kali dijalankan
        // currentIndex memiliki nilai default 0
        currentIndex: index,

        // mengubah warna icon dan label , ketika ia terselect
        selectedItemColor: Colors.white,

        // menambahkan warna yang tidak terpilih
        unselectedItemColor: Colors.black54,

        //
        selectedFontSize: 18,
        selectedLabelStyle: const TextStyle(fontSize: 18),

        unselectedFontSize: 10,
        unselectedLabelStyle:
            const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),

        iconSize: 30,

        // onTap : berisi value , yang merupakan index dari BottomNavigationBar
        // kita lakukan perubahan pada index , ketika di tap
        onTap: (value) {
          // value berisi index yang di tap
          // lalu dimasukan kedalam index , shg index berisi value yang terbaru
          setState(() {
            index = value;
          });
        },

        // required items
        // items : digunakan untuk memberi icon dan label bottomNavigationBar
        // jumlahnya sesuai dengan keinginan kita .
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carts',
          ),
        ],
      ),
    );
  }
}
