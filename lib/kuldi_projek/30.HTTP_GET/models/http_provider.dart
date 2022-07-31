import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;
  //
  void connectApi(String id) async {
    // kita buat dulu uri url dan kita pasre ke string
    Uri url = Uri.parse("https://reqres.in/api/users/ " + id);

    // kita meminta data dengan method get
    // karena data belum bisa didapat
    var hasilResponse = await http.get(url);

    // kita decode bagian data , karena pada respos ada 2 key , yaitu data dan support
    _data = (jsonDecode(hasilResponse.body))["data"];

    notifyListeners();
  }
}
