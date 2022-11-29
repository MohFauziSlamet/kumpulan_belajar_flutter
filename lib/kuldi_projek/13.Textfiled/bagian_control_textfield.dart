import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myController = TextEditingController();

  String hasil = "Belum ada inputan user";

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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        controller: myController,

                        // onchange
                        // menangkap perubahan ketika user melakaukan input pada form
                        // dan menampilkan debug
                        onChanged: (value) {
                          print("ini adalah methode onChange");
                          setState(() {
                            hasil = value;
                          });
                        },

                        // onSubmit
                        // akan muncul ketika user sudah menekan enter atau submit
                        onFieldSubmitted: (value) {
                          print(value);
                          setState(() {
                            hasil = value;
                          });
                        },

                        // menunjukan proses apa yang diketikan user , sebelum disubmit
                        onEditingComplete: () {
                          print("Editing sukses");
                        },

                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      Column(
                        children: [
                          const Text(
                            "  menggunakan myController.text,",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            (myController.text == null)
                                ? hasil
                                : myController.text,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "  menggunakan variabel hasil",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            hasil,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
