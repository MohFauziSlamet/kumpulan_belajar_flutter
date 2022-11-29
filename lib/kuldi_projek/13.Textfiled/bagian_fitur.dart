import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Latihan Text field"),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: ListView(
                children: [
                  TextFormField(
                    //ada fitur yang namanya autocorect , ini akan membenarkan text dalam bahasa inggris
                    autocorrect: true,
                    // ketika aplikasi pertama kali dibuka, textform akan langsung aktif. textform yang
                    // aktif adalah yang paling atas/pertama
                    autofocus: true,
                    //untuk merahasia kan paswword
                    obscureText: true,
                    // untuk mengubah karakter dari paswword
                    obscuringCharacter: '=',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //ada fitur yang namanya autocorect , ini akan membenarkan text dalam bahasa inggris
                    autocorrect: false,
                    // ketika aplikasi pertama kali dibuka, textform akan langsung aktif
                    autofocus: true,
                    // digunakan agar text field dapat menerima paste
                    enableInteractiveSelection: true,
                    // untuk menyesuaikan type input , misal untuk mengisi phone number, jadi
                    // lebih efektif makai type phone, karna langsung membuka angka
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
