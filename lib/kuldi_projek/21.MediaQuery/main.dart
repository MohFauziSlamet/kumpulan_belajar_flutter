import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  // penambahan 2 methode dibawah ,
  // menjadikan orientasi aplikasi kita hanya bisa portraitUp
  WidgetsFlutterBinding().ensureFrameCallbacksRegistered();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // menentukan tinggi layar hp keseluruhan
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    // menentukan tinggi layar hp keseluruhan
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    // appBar
    final myAppBar = AppBar(
      title: const Text(
        "Latihan Media Query",
      ),
      centerTitle: true,
    );

    //  mencari tinggi body saja
    //  myAppBar.preferredSize.height adl tinggi dari appbar
    //  MediaQuery.of(context).padding.top adl tinggi dri padding top yaitu untuk jam dll
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    // membuat variabel , untuk menanyakan posisi layar
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
        // kita buat percabangan untuk menanyakan orientasi layar
        // jika true yang di tampilin ini
        child: (isLandscape)
            ? Center(
                child: Column(
                  children: [
                    //
                    Container(
                      color: Colors.amber,
                      height: bodyHeight * 0.5,
                      width: mediaQueryWidth,
                    ),

                    // listtile tidak boleh langsung menjadi children dari Column
                    // karena kedua widget ini tidak memiliki tinggi ( height)
                    // jadi , solusinya , listtile harus kita bungkus dengan Container
                    // atau menggunakan sizebox
                    Container(
                      color: Colors.purple[200],
                      height: bodyHeight * 0.5,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          // jumlah GridView ke samping
                          crossAxisCount: 3,

                          // jarak atas bawah
                          mainAxisSpacing: 20,

                          // jarak kiri kanan
                          crossAxisSpacing: 20,
                        ),
                        itemCount: 10,

                        // item builder ini , digunakan untuk membentuk apa yang  akan ditampilkan
                        itemBuilder: (context, index) {
                          return GridTile(
                            footer: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/mauludy.jpg",
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "Barochatul Mauludy",
                                ),
                              ],
                            ),
                            child: Container(
                              color: Color.fromARGB(
                                255,
                                Random().nextInt(256),
                                Random().nextInt(256),
                                Random().nextInt(256),
                              ),
                            ),
                          );

                          // const ListTile(
                          //   leading: CircleAvatar(
                          //     backgroundImage: AssetImage(
                          //       "assets/mauludy.jpg",
                          //     ),
                          //   ),
                          //   title: Text(
                          //     "Mauludy",
                          //   ),
                          //   subtitle: Text(
                          //     'Barochatul Mauludy',
                          //   ),
                          // );
                        },
                      ),
                    )
                  ],
                ),
              )
            :
            // jika false yang ditampilin yang ini
            Column(
                children: [
                  //
                  Container(
                    color: Colors.amber,
                    height: bodyHeight * 0.3,
                    width: mediaQueryWidth,
                  ),

                  // listtile tidak boleh langsung menjadi children dari Column
                  // karena kedua widget ini tidak memiliki tinggi ( height)
                  // jadi , solusinya , listtile harus kita bungkus dengan Container
                  // atau menggunakan sizebox
                  Container(
                    color: Colors.purple[200],
                    height: bodyHeight * 0.7,
                    child: ListView.builder(
                      itemCount: 10,

                      // item builder ini , digunakan untuk membentuk apa yang  akan ditampilkan
                      itemBuilder: (context, index) {
                        return const ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/mauludy.jpg",
                            ),
                          ),
                          title: Text(
                            "Mauludy",
                          ),
                          subtitle: Text(
                            'Barochatul Mauludy',
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
