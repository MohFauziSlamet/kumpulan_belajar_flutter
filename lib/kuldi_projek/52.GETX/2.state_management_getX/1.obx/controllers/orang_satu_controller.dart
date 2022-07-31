import 'package:belajar_flutter/kuldi_projek/52.GETX/2.state_management_getX/1.obx/models/orang_satu.dart';
import 'package:get/get.dart';

class OrangSatuController extends GetxController {
  var orang = OrangSatu(nama: 'slamet').obs;

  void changeUpperCase() {
    orang.update((_) {
      orang.value.nama = orang.value.nama.toString().toUpperCase();
    });
  }

  void changeLowerCase() {
    orang.update((_) {
      orang.value.nama = orang.value.nama.toString().toLowerCase();
    });
  }
}
