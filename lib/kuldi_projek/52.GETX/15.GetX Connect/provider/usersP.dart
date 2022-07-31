import 'dart:convert';

import 'package:get/get.dart';

import '../models/user.dart';

class UserProvider extends GetConnect {
  // final url
  // url diambil dari realtime database
  final url =
      'https://flutter-3457f-default-rtdb.asia-southeast1.firebasedatabase.app/';

  // membuat methode post
  // kita pasang beberapa parameter , untuk data yang ingin di
  // methode ini untuk menyimpan user ke DB
  Future<Response> postData({
    required String name,
    required String email,
    required String phone,
  }) {
    // json.encode : untuk merubah data menjadi mapping
    // didalam encode , langsung kita buat format mapping
    final body = json.encode(
      {
        'name': name,
        'email': email,
        'phone': phone,
      },
    );

    // url diambil dari final url
    // body diambil dari final body
    // url wajib ditambahkan nama segment / nama colectionnya dengan dot json
    return post(url + "users.json", body);
  }

  // menghapus data dari DB
  // menghapus berdasarkan id , serta segment mana yang ingin dihapus datanya
  // jadi url nya + dengan nama segment nya + id data yang akan dihapus + dot json
  Future<Response> deleteData(String id) {
    return delete(url + 'users/$id.json');
  }

  // membuat methode edit (patch)
  // kita pasang beberapa parameter , untuk data yang ingin di edit
  // methode ini untuk menyimpan user ke DB dan mengeditnya
  Future<Response> editData({
    required String id,
    required String name,
    required String email,
    required String phone,
  }) {
    // json.encode : untuk merubah data menjadi mapping
    // didalam encode , langsung kita buat format mapping
    final body = json.encode(
      {
        'name': name,
        'email': email,
        'phone': phone,
      },
    );

    // url diambil dari final url
    // body diambil dari final body
    // url wajib ditambahkan nama segment / nama colectionnya dengan dot json
    return patch(url + 'users/$id.json', body);
  }

  Future<User?> getSingleUser(int id) async {
    final response = await get(url + 'users/$id.json');

    return User.fromJson(response.body);
  }

  Future<Map<String, dynamic>> getAllUser() async {
    final response = await get(url + 'users/.json');
    // print(response.body);

    return response.body;
  }
}
