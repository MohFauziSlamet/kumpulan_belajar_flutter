import 'dart:convert';

import 'package:belajar_flutter/kuldi_projek/42.%20Auth/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// mengarah ke [LoginScreen()
// class untuk autentcation login dan Signup
class AuthPage with ChangeNotifier {
  String? _idToken, idUser;
  DateTime? expiredToken;

  // membuat temporary data
  //  hal ini bertujuan agar ketika pengambilan token tidak langsung berkaitan dengan auth
  // dan auth akan djalankan setelah tempData dipanggil
  String? _tempidToken, tempidUser;
  DateTime? tempexpiredToken;
  void tempData() {
    _idToken = _tempidToken;
    idUser = tempidUser;
    expiredToken = tempexpiredToken;
    notifyListeners();
  }

  // function untuk memeriksa auth
  bool get isAuth {
    print('pengecekan token true atau false');

    // jika ada token , maka bernilai true
    // jika tidak ada token , maka bernilai false
    return token != null;
  }

  String? get token {
    print('pengecekan token ada atau tidak');
    if (_idToken != null && expiredToken != null) {
      //  expiredToken!.isAfter(DateTime.now() -> melakukan cek apakah token sudah expired apa tidak
      return _idToken;
    } else {
      // jika salah satu false (tidak terpenuhi ) maka akan mereturn
      return null;
    }
  }

  // function untuk Signup
  // didalam dokumentasi setidak nya harus ada email dan password
  Future<void> SignUp({String? email, String? password}) async {
    // kita buat url
    Uri url = Uri.parse(
        // API key , didapat dari firebase penyimpanan kita
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAAuf9wJj14YeQEWzv675m8_RTq3jY2jxE');

    try {
      // setelah kita buat http
      // kita simpan kedalam sebuah variabel
      var resopnse = await http.post(
        url,
        body: json.encode(
          {
            // data yang dikirim berupa maping
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );

      // untuk mengetahui key error dan message , kita harus debug dulu
      // dengan cara melakukan print pada  json.decode(resopnse.body);
      print(json.decode(resopnse.body));
      var responseData = json.decode(resopnse.body);
      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      print('pengambilan data token id dan expired');
      // mengambil token , id , dan expired token , selanjutnya dimasukan ke variabel
      // yang sudah dibuat tadi
      _tempidToken = responseData['idToken'];
      tempidUser = responseData['localId'];
      tempexpiredToken = responseData[DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])))];
      //  expiredToken = konsepnya , masa expiredToken ini dimulai dari wakatu pertama kali
      //  token di ambil , ditambah batas waktu  masa berlaku token nya
      // selanjutnya kita notiflister , agar dapat di consume oleh provider
      notifyListeners();

      //
    } catch (err) {
      throw err;
    }
  }

  // function untuk Signup
  // didalam dokumentasi setidak nya harus ada email dan password
  Future<void> login({String? email, String? password}) async {
    // kita buat url
    Uri url = Uri.parse(
        // API key , didapat dari firebase penyimpanan kita
        // url untuk login berbeda dengan signUp
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAAuf9wJj14YeQEWzv675m8_RTq3jY2jxE');

    try {
      // setelah kita buat http
      // kita simpan kedalam sebuah variabel
      var resopnse = await http.post(
        url,
        body: json.encode(
          {
            // data yang dikirim berupa maping
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );

      // untuk mengetahui key error dan message , kita harus debug dulu
      // dengan cara melakukan print pada  json.decode(resopnse.body);
      print(json.decode(resopnse.body));
      var responseData = json.decode(resopnse.body);
      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      print('pengambilan data token id dan expired');
      // mengambil token , id , dan expired token , selanjutnya dimasukan ke variabel
      // yang sudah dibuat tadi
      _tempidToken = responseData['idToken'];
      tempidUser = responseData['localId'];
      tempexpiredToken = responseData[DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])))];
      //  expiredToken = konsepnya , masa expiredToken ini dimulai dari wakatu pertama kali
      //  token di ambil , ditambah batas waktu  masa berlaku token nya
      // selanjutnya kita notiflister , agar dapat di consume oleh provider
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
