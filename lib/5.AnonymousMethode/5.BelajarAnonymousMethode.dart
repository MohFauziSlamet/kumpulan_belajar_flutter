import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String massage = 'Ini tanpa Anonymous Methode';

  void tekanSaya() {
    setState(() {
      massage = 'Yeee kamu sudah menekan saya';
    });
  }

  void tombolKembali() {
    setState(() {
      massage = pesan2;
    });
  }

  String pesan1 = 'Ini dengan anonymous methode';

  String pesan2 = 'Ini tanpa anonymous methode';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Belajar Anonymous Methode'),
        ),

        //
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                massage,
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: tekanSaya,
                child: const Text('Tekan Saya'),
              ),
              ElevatedButton(
                onPressed: tombolKembali,
                child: const Text('Kembali'),
              ),

//=========================================================================
              Text(
                pesan1,
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  child: const Text('Tekan Tombol'),
                  onPressed: () {
                    //perubahan saat tombol ditekan
                    setState(
                      () {
                        pesan1 = 'Yaaa tombol berhasil diekan';
                      },
                    );
                  }),
              ElevatedButton(
                child: const Text('Kembali'),
                onPressed: () {
                  String pesanGanti = 'ini dengan anonymous methode';
                  setState(
                    () {
                      pesan1 = pesanGanti;
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
