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
                  const Text(
                    "Textfield fitur",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
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

                  // Textfield decoration
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Textfield Decoration",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    // untuk menampilkan dan menyembunyikan kursor
                    // jika true , kursor keliahatan
                    // jika false , kursor tidak keliahatan
                    showCursor: true,

                    // memberi warna pada kursor
                    cursorColor: Colors.purple,

                    // menamahkan ketebalan kursor
                    cursorWidth: 5,

                    // menambahkan radis
                    cursorRadius: const Radius.circular(2),

                    // memindahkan posisi kurso teks
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // memindahkan posisi kurso teks
                    textAlign: TextAlign.start,

                    // mengatur tinggi text (top , center , bottom)
                    textAlignVertical: TextAlignVertical.center,

                    // mengatur kapital fonts
                    // textCapitalization: TextCapitalization.words,
                    // textCapitalization: TextCapitalization.characters,
                    textCapitalization: TextCapitalization.sentences,

                    // mengaatur warna , ukuran , weigh , fontfamily dll didalam TextFormField
                    // kita menggunakan style
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(
                        // memberikan icon diluar text input
                        Icons.person,
                        size: 30,
                      ),

                      // memberikan border pada Textfield
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // menambhkan icon didalam Textfield
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                      ),

                      // menambahkan text petunjuk pengisian
                      // prefixText: "Name : ",
                      prefixStyle: TextStyle(
                        color: Colors.lightBlue,
                      ),

                      // menambahkan text petunjuk pengisian dengan prefix
                      // jika menggunakan prefix , maka jangan memakai prefixText
                      // karena penempatan prefix dan prefixtext , sama sama setelah prefix icon
                      prefix: Text("Name : "),

                      // Menambhakn penamaan awal , namun ketika user mulai mengisi TextFormField ,
                      // maka nama awal akan hilang
                      hintText: " Masukan nama Anda yaa",

                      // mengubah warna hint
                      hintStyle: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                  //
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                      label: Text(
                        "Nama Lengkap Anda ",
                      ),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                      hintText: " Masukan nama Anda yaa",
                      hintStyle: TextStyle(
                        color: Colors.lightBlue,
                      ),

                      //mengubah warna border ketika aktif
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      //mengubah warna border ketika aktif
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 5,
                        ),
                      ),
                    ),
                  ),

                  //
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.green,
                      ),
                      prefixStyle: const TextStyle(
                        color: Colors.green,
                      ),
                      border: const OutlineInputBorder(),
                      label: const Text(
                        "Nama Lengkap Anda ",
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                      hintText: " Masukan nama Anda yaa",
                      hintStyle: const TextStyle(
                        color: Colors.lightBlue,
                      ),

                      //mengubah warna border ketika aktif
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      //mengubah warna border ketika aktif
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 5,
                        ),
                      ),

                      // Menambhakn icon dibelakang
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                      ),
                    ),
                    // menambahkan obscureText
                    obscureText: true,
                    obscuringCharacter: "A",
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
