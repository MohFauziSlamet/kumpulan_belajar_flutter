import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> ambilData() async {
    Uri url = Uri.parse("https://reqres.in/api/users/12");

    var hasilGet = await http.get(url);

    try {
      if (hasilGet.statusCode >= 200 && hasilGet.statusCode < 300) {
        var data = json.decode(hasilGet.body)['data'] as Map<String, dynamic>;

        return data;
      } else {
        throw (hasilGet.statusCode);
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FuturenBuilder"),
      ),
      //
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          // snapshot merupakan isi data
          if (snapshot.error != null) {
            print(snapshot.error);
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(fontSize: 35),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // untuk menampilkan data , kita cas dulu type objek ke dalam bentuk map
            var data = snapshot.data as Map;
            print(data);
            return Center(
              child: Text(
                "${data['first_name']}   ${data['last_name']}",
                style: TextStyle(fontSize: 35),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ambilData();
        },
        child: Icon(Icons.get_app),
      ),
    );
  }
}
