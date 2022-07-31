import 'package:belajar_flutter/kuldi_projek/52.GETX/2.state_management_getX/1.obx/models/orang.dart';
import 'package:get/get.dart';

class OrangController extends GetxController {
  // controller merupakan tempat semua fungsi" , untuk mengubah tampilan
  // pada aplikasi

  var orang = Orang();

  void upper() {
    orang.nama.value = orang.nama.value.toUpperCase();
  }

  void lower() {
    orang.nama.value = orang.nama.value.toLowerCase();
  }
}
