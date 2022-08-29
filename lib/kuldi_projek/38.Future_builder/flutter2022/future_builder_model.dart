import 'dart:convert';

import 'package:belajar_flutter/kuldi_projek/38.Future_builder/flutter2022/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(FutureBuilderApp());
}

class FutureBuilderApp extends StatelessWidget {
  const FutureBuilderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  // karena data dari database berupa map , kita buat list of UserModel

  List<UserModel> getAllUser = [];

  // membuat function future
  Future getAllUsers() async {
    // Future.delayed(Duration(seconds: 2));
    try {
      var response = await http.get(
        Uri.parse('https://reqres.in/api/users'),
      );
      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];

      //  memasukan data ke getAllUser
      data.forEach((element) {
        getAllUser.add(userModelFromJson(element));
      });
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
        title: Text('Future Builder App'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getAllUsers(),
        builder: (context, snapshot) {
          // snapshot untuk mengecek status proses pengambilan data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'Loading....',
                style: TextStyle(fontSize: 24),
              ),
            );
          } else {
            if (getAllUser.length == 0) {
              return Center(
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
                            NetworkImage(getAllUser[index].avatar)),
                    title: Text(
                        '${getAllUser[index].firstName} ${getAllUser[index].lastName}'),
                    subtitle: Text('${getAllUser[index].email}'),
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
        child: Text('Get Data Disini'),
        onPressed: () async {
          var response = await http.get(
            Uri.parse('https://reqres.in/api/users'),
          );
          // // mengecek isi data response
          // print(response.body);

          //
          List data =
              (json.decode(response.body) as Map<String, dynamic>)['data'];

          data.forEach(
            (element) {
              Map<String, dynamic> user = element;
              print(user['email']);
            },
          );
        },
      ),
    );
  }
}
