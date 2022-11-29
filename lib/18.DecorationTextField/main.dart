import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // textfield membutuhkan sebuah controller , agar bisa menerima input
  // textfield bisa diberi dengan nama awal , dengan memberi parameter pada TextEditingController()
  TextEditingController controllerNamaDepan =
      TextEditingController(text: "Nama Depan");
  TextEditingController controllerNamaBelakang = TextEditingController();
  TextEditingController controllerNim = TextEditingController();
  TextEditingController controllerJurusan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.adb_sharp,
            color: Colors.green,
          ),
          title: Container(
            child: Column(
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
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout_sharp,
                  color: Colors.black,
                )),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
                image: DecorationImage(
                    image: AssetImage("assets/mauludy.jpg"),
                    fit: BoxFit.none,
                    repeat: ImageRepeat.repeat)),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Text("Textfield dengan nama default "),
              TextField(
                onChanged: (value) {
                  // digunakan untuk mengambil nilai dan merefresh tampilan
                  setState(() {});
                },
                controller: controllerNamaDepan,
              ),
              Text(controllerNamaDepan
                  .text), // untuk mengambil nilai yang ada pada textfield
              const SizedBox(
                height: 50,
              ),
              // // digunakan untu membuat tulisan menjadi tanda bintang, seperti password
              const Text("Textfield dengan obscuretext "),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerNamaBelakang,
              ),
              Text(controllerNamaBelakang.text),
              const SizedBox(
                height: 50,
              ),
              //----
              const Text("Textfield dengan maxlength "),
              TextField(
                // maxLength digunakan untuk membatasi input fonts sebanya nilainya yaitu 7
                maxLength: 7,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerNim,
              ),
              Text(controllerNim.text),
              const SizedBox(
                height: 50,
              ),
              //--
              const Text("Textfield dengan maxlines "),
              TextField(
                // untuk menampilkan data pada field hanya dua baris saja, namun
                // fonts nya tidak terbatas.
                maxLines: 2,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              Text(controllerJurusan.text),
              const SizedBox(
                height: 50,
              ),
              //---
              const Text("Textfield dengan decoration , border none "),
              TextField(
                decoration: const InputDecoration(
                    // digunakan untuk menghilangkan garis bawah pada border
                    border: InputBorder.none),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const Text("Menghilangkan garis bawah pada boder textfield"),
              const SizedBox(
                height: 50,
              ),
              const Text("Textfield dengan decoration , input border "),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk menghilangkan garis bawah pada border
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border , dan icon"),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk memberi garis border pada textfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(
                        Icons.adb) // icon diletakkan diluar Textfield
                    ),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border , dan icon"),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk memberi garis border pada textfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(
                        Icons.person) // prefixIcon diletakan didalam textfield
                    ),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border ,prefixicon dan prefix text"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk memberi garis border pada textfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                    prefixText: "Name :",
                    prefixStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border , dan icon dan prefixtext"),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk memberi garis border pada textfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(Icons.person),
                    prefixText: "Name :",
                    prefixStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border ,prefixicon ,prefix text dan label"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk memberi garis border pada textfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                    prefixText: "Name :",
                    prefixStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    label: const Text("Nama Lengkap"),
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border ,prefixicon ,prefix text ,  label , dan hintText"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    // digunakan untuk memberi garis border pada textfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                    prefixText: "Name :",
                    prefixStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    label: const Text("Nama Lengkap"),
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                    hintText: "Nama Lengkap Anda ",
                    hintStyle: const TextStyle(
                      color: Colors.blue,
                    )),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Textfield dengan decoration , input border ,prefixicon ,prefix text dan label"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  // digunakan untuk memberi garis border pada textfield
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.person),
                  prefixText: "Name :",
                  prefixStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  label: const Text("Nama Lengkap"),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  fillColor: Colors.blue[100],
                  filled:
                      true, // harus bernilai true, artinya kita memberi tahu bahwa textfield kita beri warna
                ),
                onChanged: (value) {
                  setState(() {});
                },
                controller: controllerJurusan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
note
jika ingin menggunakan prefix , maka tidak boleh ada prefixtext , kalo dipaksa
akan error. prefix berupa widget, namun letaknya didepan
sufix sama dengan prefix, beda nya sufix terletak diblakang.
kalo sufix , bisa digunakan bersamaan dengan prefixtext, namun tidak dengan 
sufixtext

 */
