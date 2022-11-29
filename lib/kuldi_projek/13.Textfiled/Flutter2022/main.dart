import 'package:flutter/material.dart';

// propereti TextField:
// autocorrect: untuk membenarkan , atau memberi saran penulisan
// autocorrect harus di false ketika menggunakan password
void main(List<String> args) {
  runApp(const TextFieldApp());
}

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHidden = true;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Text Field App'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailC,
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: passC,
            autocorrect: false,
            // menajdikan tidak bisa dibaca inputannya
            obscureText: isHidden,
            // mengubah karakter
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                icon: const Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  if (isHidden == true) {
                    isHidden = false;
                  } else {
                    isHidden = true;
                  }
                  setState(() {});
                },
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              print(
                  'LOGIN DENGAN EMAIL : (${emailC.text}) DAN PASSWORD : (${passC.text})');
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
            child: const Text(
              'LOGIN',
              style: TextStyle(letterSpacing: 10),
            ),
          )
        ],
      ),
    );
  }
}
