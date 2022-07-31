import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(DeleteApp());
}

class DeleteApp extends StatelessWidget {
  const DeleteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  // inisiasi awal
  String data = 'Belum ada data';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Delete'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.get_app),
            onPressed: () async {
              // mengambil data
              var response =
                  await http.get(Uri.parse('https://reqres.in/api/users/2'));

              Map<String, dynamic> dataResponse = json.decode(response.body);
              // melihat isi dari data
              print(dataResponse);
              print(dataResponse['data']['first_name']);

              // memasukkan kedalam data inisiasi awal
              setState(() {
                data =
                    "Akun : ${dataResponse['data']['first_name']} ${dataResponse['data']['last_name']}";
              });
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            data,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Berhasil hapus data'),
                ),
              );
              // mengambil data
              var response =
                  await http.delete(Uri.parse('https://reqres.in/api/users/2'));
              print(response.statusCode);
              print('Berhasil hapus data');
              setState(() {
                data = 'Belum ada data';
              });
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
