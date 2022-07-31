import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // textfield membutuhkan sebuah controller , agar bisa menerima input
  // textfield bisa diberi dengan nama awal , dengan memberi parameter pada TextEditingController()
  TextEditingController controllerNamaDepan =
      TextEditingController(text: "Nama Depan");
  TextEditingController controllerNamaBelakang =
      TextEditingController(text: "Nama Belakang");
  TextEditingController controllerNim = TextEditingController(text: "Nim");
  TextEditingController controllerJurusan =
      TextEditingController(text: "Jurusan");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.adb_sharp,
            color: Colors.green,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Latihan Text Field",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  "Latihan membuat textfield dengan input user",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
              image: DecorationImage(
                  image: AssetImage("assets/icon/mauludy.jpg"),
                  fit: BoxFit.none,
                  repeat: ImageRepeat.repeat),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(),
                // obscureText: true, // digunakan untu membuat tulisan menjadi tanda bintang, seperti password
                onChanged: (value) {
                  // digunakan untuk mengambil nilai dan merefresh tampilan
                  setState(
                    () {},
                  );
                },
                controller: controllerNamaDepan,
              ),
              // Text(controllerNamaDepan.text),
              TextField(
                // obscureText: true,
                onChanged: (value) {
                  setState(
                    () {},
                  );
                },
                controller: controllerNamaBelakang,
              ),
              // Text(controllerNamaBelakang.text),
              TextField(
                // obscureText: true,
                onChanged: (value) {
                  setState(
                    () {},
                  );
                },
                controller: controllerNim,
              ),
              // Text(controllerNim.text),
              TextField(
                // obscureText: true,
                onChanged: (value) {
                  setState(
                    () {},
                  );
                },
                controller: controllerJurusan,
              ),
              // Text(controllerJurusan.text),
            ],
          ),
        ),
      ),
    );
  }
}
