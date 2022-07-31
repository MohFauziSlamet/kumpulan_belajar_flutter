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
          leading: const Icon(
            Icons.adb_sharp,
            color: Colors.green,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "AppBar Example",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  "Membuat contoh appbar dengan gradasi warna dan corak",
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
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
AppBar terdiri dari beberapa bagian, diantaranya leading, tittle , action , flexibleSpace
dan bottom,
leading biasanya dipakai untuk menambahkan sebuah logo atau biasanya dipakai untuk drawer 
(burgerMenu) garis tiga. kalo ditekan akan muncul menu dari samping.

tittle biasanya diisi untuk menulis judul, sebenarnya tittle adalah widget , 
widget sendiri dapat diisi apapun bukan hanya text saja, bisa diisi dengan container, 
row, column dll. 

action biasanya digunakan untuk memberi icon-icon seperti logout , setting dll

bottom , biasanya digunakan untuk menambahkan tabbar.

flexibleSpace , adalah bagian yang diluar semua widget yang ada di appbar. seperti
tittle, action , dll. didalam sinilah kita akan memberikan corak pada appBar kita

 */