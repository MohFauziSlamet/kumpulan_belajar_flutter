import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  // variabel tampung untuk get data
  late String id;
  late String email;
  late String name;

  // inisisasi awal ketika pertama dijalankan
  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Http Get'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // tempat nampilin get data
            Text(
              'ID : $id',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              'EMAIL : $email',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              'NAME: $name',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("Get Data"),
              onPressed: () async {
                var hasilResponse =
                    await http.get(Uri.parse('https://reqres.in/api/users/1'));
                Map<String, dynamic> hasilJsonDecode =
                    jsonDecode(hasilResponse.body);
                if (hasilResponse.statusCode == 200) {
                  // jika berhasil get data
                  print('Berhasil Get Data : $hasilJsonDecode');
                  setState(() {
                    id = hasilJsonDecode['data']['id'].toString();
                    email = hasilJsonDecode['data']['email'].toString();
                    name =
                        "${hasilJsonDecode['data']['first_name']} ${hasilJsonDecode['data']['last_name']}";
                  });
                } else {
                  // jika gagal get data
                  print('Error ${hasilResponse.statusCode}');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
