import 'package:flutter/material.dart';

//Keyword
/*
--Properti maxlines : memberikan batasan berapa baris pada suatu kalimat .
misal maxline 2 , artinya maksimal baris dalam kalimat hanya dua .
--Properti Overlflov : untuk mengatur bagaimana text kita ditampilkan , jika terpotong.
--properti softwrap : default nya bernilai true . jika true, maka text akan dipotong kebawah,
jika false text akan dilanjut kesamping , meskipun container tidak cukup , maka akan ditulis 
secukupnya .
--Properti TextAlign : mengatur posisi text , bisa rata kiri , kanan , tengah , atau kiri kanan
--Propereti Style : mengatur bagaimana gaya dari fonts tsb , bisa warna, ukuran , bold/miring
jenis font dll

Dalam perumpamaan , sebuah lukisan.
Materialapp merupakan sebuah papanlukisan. -> widget dasar pertama
dan scaffold merupakan seubah kanvasnya. - > widget dasar kedua 

Appbar:
didalam appbar , ada yang namanya centerTitle , 
ia bertype boolean . 
pada android defaultnya bernilai false = berada disamping
pada ios defaultnya bernilai true = berada ditengah
backgroundColor : memberi warna background pada appbar . defaultnya adl biru .



widget Center:
untuk merubah posisi widget berada pada titik point tengah suatu widget. .
 */
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text widget'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Stack(
          children: [
            Container(
              // margin: EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
                Colors.lightGreenAccent,
                Colors.purpleAccent,
                Colors.blue,
              ])),
            ),
            ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: FlutterLogo(
                        curve: Curves.easeInQuint,
                        size: 70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Ini ElevatedButton'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                        child: Icon(
                      Icons.home,
                      color: Colors.lightBlue,
                      size: 70,
                    )),
                    const SizedBox(height: 20),
                    const Text("1.Tanpa tambahan apapun ", style: TextStyle(fontSize: 18, color: Colors.black)),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text('saya sedang melatih kemampuan flutter saya'),
                    ),
                    const Text("2.Dengan tambahan properti MaxLines 2 ", style: TextStyle(fontSize: 18, color: Colors.black)),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        maxLines: 2, //memberikan maksimal baris hanya 2
                      ),
                    ),
                    const Text(
                      "3.Tambahan properti MaxLines 2 dan Overflov.Elipsis ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // text yang terpotong diberi tanda titik titik
                      ),
                    ),
                    const Text(
                      "4.Tambahan properti MaxLines 2 dan Overflov.Clip ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        maxLines: 2,
                        overflow: TextOverflow.clip, // text langsung dipotong
                      ),
                    ),
                    const Text(
                      "5.Tambahan properti MaxLines 2 dan Overflov.fade ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        // text langsung dipotong sama Dengan clip
                      ),
                    ),
                    const Text(
                      "6.Tambahan properti MaxLines 2 dan Overflov.Visible ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        maxLines: 2,
                        overflow: TextOverflow.visible, // text langsung dipotong
                      ),
                    ),
                    const Text(
                      "7.Tambahan properti MaxLines 2 dan softwrap:false ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        // maxLines: 2,
                        softWrap: false, // text hanya dibuat 1 baris
                      ),
                    ),
                    const Text(
                      "8.Tambahan properti MaxLines 2 dan softwrap:true ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 50,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        // maxLines: 2,
                        softWrap: true, // dicetak apaadanya sesuai dengan jumlah text
                      ),
                    ),
                    const Text("9.Dengan tambahan properti TextAlign.Center ", style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text("10.Dengan tambahan properti TextAlign.End ", style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const Text(
                      "11.Dengan tambahan properti TextAlign.Justify ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Text(
                      "12.Dengan tambahan properti TextAlign.Left ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Text(
                      "13.Dengan tambahan properti TextAlign.Right ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Text(
                      "14.Dengan tambahan properti TextAlign.Start ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Text(
                      "15.Dengan tambahan properti Style : TextStyle.colors ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Text(
                      "16.Dengan tambahan properti Style : TextStyle.colors, FontStyle.italic ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                    const Text(
                      "17.Dengan tambahan properti Style : TextStyle.colors, FontStyle.italic , Fontweight",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 150,
                      height: 60,
                      color: Colors.lightBlue,
                      child: const Text(
                        'saya sedang melatih kemampuan flutter saya',
                        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
