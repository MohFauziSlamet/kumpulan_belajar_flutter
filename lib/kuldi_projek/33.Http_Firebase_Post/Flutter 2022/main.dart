import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  runApp(const PostApp());
}

class PostApp extends StatelessWidget {
  const PostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controller TextField
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  // nilai awal
  String hasilResponse = 'Belum ada data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Post 2022'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              label: Text('Name'),
              labelStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: jobController,
            autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              label: Text('Job'),
              labelStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () async {
              // methode post
              var response = await http.post(
                Uri.parse('https://reqres.in/api/users'),
                body: {
                  "name": nameController.text,
                  "job": jobController.text,
                },
              );
              // mengecek isi hasil response
              print(response.body);

              // mengconvert response
              Map<String, dynamic> dataResponse = json.decode(response.body);
              print(dataResponse);

              // memasukan data ke variabel hasil response
              // karena merubah tampilan , kita butuh setstate
              setState(() {
                hasilResponse =
                    "${dataResponse["name"]} - ${dataResponse["job"]}";
              });
            },
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.black,
            height: 5,
          ),
          const SizedBox(height: 20),
          Text(
            hasilResponse,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
