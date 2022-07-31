import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddC extends GetxController {
  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController phoneC;

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    phoneC = TextEditingController();
  }

/*
onClose():
Dipanggil sebelum metode [onDelete]. [onClose] dapat digunakan untuk membuang sumber 
daya yang digunakan oleh controller. Seperti saat penutupan, atau streaming sebelum 
controller dihancurkan. Atau membuang objek yang berpotensi membuat beberapa 
kebocoran memori, seperti TextEditingControllers, AnimationControllers. 
Mungkin berguna juga untuk menyimpan beberapa data pada disk.

dispose():
Membuang sumber daya apa pun yang digunakan oleh objek. Setelah ini dipanggil, 
objek tidak dapat digunakan dan harus dibuang (panggilan ke [addListener] dan 
[removeListener] akan melempar setelah objek dibuang).
Metode ini hanya boleh dipanggil oleh pemilik objek.
 */
  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
