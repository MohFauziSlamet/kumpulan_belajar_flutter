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
  bool valueStatus = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Latihan switch button",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              // penambahan adaptive , agar tampilan disesuaikan didalam ios
              Switch.adaptive(
                // value: nilai yang akan diubah valuenya, untuk menyatakan on or off
                value: valueStatus,

                // mengubah nilai value
                onChanged: (value) {
                  setState(() {
                    valueStatus = !valueStatus;
                  });
                  print(valueStatus);
                },

                // mengubah warna aktif switch
                activeColor: Colors.green,

                // mengubah warna ketika switch tidak aktif
                inactiveThumbColor: Colors.grey,

                // mengubah warna track ketika switch  aktif
                activeTrackColor: Colors.purple,

                // mengubah warna track ketika switch tidak aktif
                inactiveTrackColor: Colors.green,

                // mengubah warna aktif switch dengan gambar
                activeThumbImage: const AssetImage(
                  "assets/images/senang.jpg",
                ),

                // mengubah warna tidak aktif switch dengan gambar
                inactiveThumbImage: const AssetImage(
                  "assets/images/kaget.png",
                ),
              ),

              //
              const SizedBox(
                height: 10,
              ),

              //
              Text(
                (valueStatus == true) ? "Switch On " : "Switch Off  ",
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
