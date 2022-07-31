import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

// karena tidak mengembalikan apapun kita gunakan void
  void connectApi(String name, String job) async {
    // kita parse string kedalam uri
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");

    // http.post , digunakan untuk mengirim data ,
    // dan data yang dikirm ada 2
    // setelah mangirim data (request) , akan ada response
    // response tsb langsung kita masukan kedalam variabel
    // tiap kali ada request pasti ada response
    // var hasilResponse merupakan tempat untuk menampung respon
    var hasilResponse = await http.post(
      url,
      // didalam body berisi data yang akan dikirimkan
      body: {"name": name, "job": job},
    );

    // kita sudah mendapat kan response data yang disimpan kedalam hasilResponse
    // selanjut nya kita parsing dan kita masukan kedalam constructor
    // penambahan await dan async ,
    // artinya , ketika pertama kali mengirim data , kan blm ada response.
    // ketika belum ada respon , hasilResponse masih kosong .
    // jadi sebelum hasilResponse di decode , kita suruh nunggu dulu .dengan memberi method await
    // await merupakan future , jadi kita harus menambahkan async
    _data = json.decode(hasilResponse.body);

    notifyListeners();
  }
}
