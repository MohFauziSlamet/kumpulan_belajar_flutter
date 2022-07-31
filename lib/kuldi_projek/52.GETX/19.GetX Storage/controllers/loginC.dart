import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginC extends GetxController {
  // controller input untuk form login
  // hanya di inisiasi , dan akan dijalankan ketika di panggil dalam on onInit
  late TextEditingController emailC;
  late TextEditingController passwordC;

  // variabel untuk hidden Password
  RxBool hidden = true.obs;

  // variabel untuk tetap login
  var rememberMe = false.obs;

  // menjalankan textditing controller ketika pertama dijalankan
  // tujuan dimasukan didalam onInit , agar dapat dispose. agar tidak terjadi
  // kebocoran memori , yang disebabkan oleh TextEditingController
  @override
  void onInit() async {
    super.onInit();
    emailC = TextEditingController();
    passwordC = TextEditingController();

    // kita pasang jembatan get_storage
    final box = GetStorage();

    // kita akan memasukan data yang sudah ada , kedalam TextField.
    // namun , jika tidak ada data , maka akan dibiarkan kosong

    // kita check terlebih dahulu , datanya ada apa tidak
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      emailC.text = data['email'];
      passwordC.text = data['password'];
      rememberMe = data['rememberMe'] as RxBool;
    }
  }

  // menutup TextEditingController ,
  // ketika page di tutup
  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
