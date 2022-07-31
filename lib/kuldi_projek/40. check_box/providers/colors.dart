import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './color.dart';

class MultiColor with ChangeNotifier {
  // list of SingleColor , class yang berisi struktur model nya
  // kita buat datanya privat
  List<SingleColor> _colors = [];

  // kita buat getter , untuk mengakses datanya
  List<SingleColor> get colors => _colors;

  // inisiasi data saat awal aplikasi dijalankan
  initialData() async {
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/colors.json");

    // kita gunakan try catch untuk pengecekan apakah nanti ada error apa tidak
    try {
      var hasil = await http.get(url);

      // menambahkan pada list
      if (hasil.statusCode >= 200 && hasil.statusCode < 300) {
        //
        var hasilGetData = json.decode(hasil.body) as Map<String, dynamic>;

        hasilGetData.forEach(
          (key, value) {
            _colors.add(
              SingleColor(
                id: key,
                title: value['title'],
                status: value['status'],
              ),
            );
          },
        );
        notifyListeners();
      } else {
        throw (hasil.statusCode);
      }
    } catch (error) {
      throw (error);
    }
  }

  // untuk mengecek , apakah semua true atau false
  // membutuhkan parameter nilai boolean , nilainya didapat dari checkbox select all
  void selectAll(bool? nilai) {
    // jika nilai yang didapat true
    // maka semua yang ada didalam list , dibuah statusnya menjadi true
    if (nilai!) {
      _colors.forEach((element) {
        element.status = true;
      });
    } else {
      // jika nilai yang didapat false
      // maka semua yang ada didalam list , dibuah statusnya menjadi false
      _colors.forEach((element) {
        element.status = false;
      });
    }
    notifyListeners();
  }

  // mengecek tiap tiap item , jika semua true ,
  // akan merubah allStatus true , yang akan merubah selectAll menjadi true
  checkAllStatus() {
    // apakah semua elemen bernilai true
    var hasil = _colors.every((element) => element.status == true);
    return hasil;
  }

  // fungsi untuk menambahkan kedalam list color
  void addColor(String title) async {
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/colors.json");

    // kita gunakan try catch untuk pengecekan apakah nanti ada error apa tidak
    try {
      var hasil = await http.post(
        url,
        body: json.encode({
          // kalau mengirim encode
          // kalau mengambil decode
          "title": title,
          "status": false,
        }),
      );

      // menambahkan pada list
      if (hasil.statusCode >= 200 && hasil.statusCode < 300) {
        // kita tambahkan sesuai dengan model dari list tsb
        // yaitu clas SingleColor
        _colors.add(
          SingleColor(
            id: json.decode(hasil.body)['name'],
            title: title,
            // karean didalam model , sudah ada status dan defaultnya false ,
            // kita tidak perlu menambahkan lagi
          ),
        );
        notifyListeners();
      } else {
        throw (hasil.statusCode);
      }
    } catch (error) {
      throw (error);
    }
  }

  // fungsi untuk menghapus berdasarkan id didalam list color
  // kita butuh parameter id , untuk mencocokan dengan id yang ingin dihapus
  void deleteColor(String id) async {
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/colors/$id.json");

    // kita gunakan try catch untuk pengecekan apakah nanti ada error apa tidak
    try {
      var hasil = await http.delete(url);

      if (hasil.statusCode >= 200 && hasil.statusCode < 300) {
        // kita gunakan function  removeWhere untuk melakukan chek pada id
        _colors.removeWhere((element) => element.id == id);
        notifyListeners();
      } else {
        throw (hasil.statusCode);
      }
    } catch (error) {
      throw (error);
    }
  }
}
