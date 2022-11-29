import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  height: 200,
                  child: Lottie.asset("assets/lotties/password.json"),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Silahkan masukan email anda , kami akan mereset password anda',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: const Text('Masukan email anda'),
                      prefix: const Text('Email : '),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Colors.amber),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
