import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user.dart';
import '../provider/usersP.dart';

class UsersC extends GetxController {
  //
  var users = List<User>.empty().obs;

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  void add(String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        // contains : Apakah string ini berisi kecocokan [lainnya].
        // untuk mengecek , apakah tanda @ ada dalam variabel email

        // kita panggil user provider
        // kita harus mengimport path classnya
        UserProvider()
            .postData(
          name: name,
          email: email,
          phone: phone,
        )
            .then(
          (value) {
            // cara mengambil id dari firebase.
            print(value.body['name']);

            // karena methode postData bertipe future , kita bisa memanggil fungsi then
            // fungsi then akan dijalankan , ketika postData sudah selesai dilakukan.
            // disini , kita akan menambahkan kedalam local memori , setelah di simpan kedalam DB
            // tujuannya agar dapat ditampilkan.

            // kita tambahkan ke local memori
            // yaitu ke List users
            // dan id yang digunakan , sudah dari DB

            users.add(
              User(
                id: value.body['name'].toString(),
                name: name,
                email: email,
                phone: phone,
              ),
            );
          },
        );

        // setelah berhasil post or add
        // kita tutup page , kembali ke page sebelumnya
        Get.back();
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  User userById(String id) {
    return users.firstWhere((element) => element.id == id);
// firstWhere : Mengembalikan elemen pertama yang memenuhi predikat [tes] yang diberikan.
// Iterasi melalui elemen dan mengembalikan yang pertama untuk memenuhi [tes].
// firstWhere() untuk menemukan elemen pertama yang memenuhi kondisi tertentu.
// Metode ini mengharuskan Anda untuk lulus predikat, yang merupakan fungsi
// yang mengembalikan benar jika input memenuhi kondisi tertentu.
  }

  void edit(String id, String name, String email, String phone) {
    if (name != '' && email != '' && phone != '') {
      if (email.contains("@")) {
        // memanggil UserProvider
        // memanggil function editData
        UserProvider()
            .editData(id: id, name: name, email: email, phone: phone)
            .then(
          (value) {
            final user = userById(id);
            user.name = name;
            user.email = email;
            user.phone = phone;
            users.refresh();
            Get.back();
          },
        );
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  // menghapus data dari db dan local memori
  Future<bool> delete(String? id) async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE",
      middleText: "Apakah kamu yakin untuk menghapus data user ini?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        // memnaggil user provider , fungsi deleteData
        UserProvider().deleteData(id!).then((_) {
          // setelah menghapus dari DB
          // selanjutnya menghapus dari list (local memori)
          users.removeWhere((element) => element.id == id);
          _deleted = true;
        });

        // menutup dialog
        Get.back();
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }

  ///
  UserProvider userProvider = UserProvider();

  Future<User?> singleUser(int id) async {
    return await userProvider.getSingleUser(id);
  }

  Future<User?> allUser() async {
    var data = userProvider.getAllUser();
  }
}
