import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const FutureBuilderApp());
}

class FutureBuilderApp extends StatelessWidget {
  const FutureBuilderApp({Key? key}) : super(key: key);

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
  // kita buat list penampung data
  // karena data dari database berupa map , kita buat list of map
  List<Map<String, dynamic>> getAllUser = [];

  // membuat function future
  Future getAllUsers() async {
    Future.delayed(const Duration(seconds: 2));
    try {
      var response = await http.get(
        Uri.parse('https://reqres.in/api/users'),
      );
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];

      //  memasukan data ke getAllUser
      for (var element in data) {
        getAllUser.add(element);
      }
      print(getAllUser);
    } catch (e) {
      print('Telah tejadi kesalahan');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder App'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllUsers(),
        builder: (context, snapshot) {
          // snapshot untuk mengecek status proses pengambilan data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                'Loading....',
                style: TextStyle(fontSize: 24),
              ),
            );
          } else {
            if (getAllUser.isEmpty) {
              return const Center(
                child: Text(
                  'Tidak ada data',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: getAllUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            NetworkImage(getAllUser[index]['avatar'])),
                    title: Text(
                        '${getAllUser[index]['first_name']} ${getAllUser[index]['last_name']}'),
                    subtitle: Text('${getAllUser[index]['email']}'),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

// mengambil data dengan mengkklik button terlebih dahulu
class WithKlikButton extends StatelessWidget {
  const WithKlikButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Get Data Disini'),
        onPressed: () async {
          var response = await http.get(
            Uri.parse('https://reqres.in/api/users'),
          );
          // // mengecek isi data response
          // print(response.body);

          //
          List data =
              (json.decode(response.body) as Map<String, dynamic>)['data'];

          for (var element in data) {
              Map<String, dynamic> user = element;
              print(user['email']);
            }
        },
      ),
    );
  }
}
