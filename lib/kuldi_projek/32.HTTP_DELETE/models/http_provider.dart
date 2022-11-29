import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  // karena methode delete juga membutuhkan url , dan kebetulan url yang dibutuhkan
  // sama dengan yang dipunya oleh get . maka url ini kita buat secara global
  late Uri url;

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/$id");

    var hasilResponse = await http.get(url);

    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))["data"];
      notifyListeners();
      print(hasilResponse.statusCode);
      handlingStatusCode(context, message: "Berhasil Get Data");
    } else {
      print("Error! ${hasilResponse.statusCode}");
    }
  }

  // jadi dalam methode delete , ngak perlu membuat url baru , dan parameter String
  // karena string  sudah inclcude dengan uri url
  void deleteData(BuildContext context) async {
    // http delete , sebenarnya adalah methode future , yang bisa menggunakan then()
    // jadi , misal tidak dimasukan kedalam variabel hasil juda bisa
    // await http.delete(url).then((hasilResponse) => {});
    var hasilResponse = await http.delete(url);

    // dikarenakan delete tidak mengembalikan data
    // hanya mengembalikan status respon
    // maka yang di ambil adalah status responnya
    // dengan cara menggunakan hasilResponse.statuscode
    if (hasilResponse.statusCode == 204) {
      // kita kosong kan lagi datanya
      // jangan lupa memberi notifyListeners , untuk memberitahu listener provider
      _data = {};
      notifyListeners();

      print(hasilResponse.statusCode);

      handlingStatusCode(context,
          message:
              "Data berhasil dihapus${hasilResponse.statusCode}");
    }
  }

  // karena didalam class ini tidak ada methode buildContext , maka kita
  // tambahkan secara manual .
  handlingStatusCode(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }
}
