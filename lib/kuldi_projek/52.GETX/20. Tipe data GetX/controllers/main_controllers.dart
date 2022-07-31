import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt count = 0.obs;
  RxString dataString = 'halo'.obs;
  RxDouble dataDouble = 0.0.obs;
  RxBool dataBoolean = false.obs;

//==============RXInt=================
  void tambah() {
    count = count++;
  }

  void kurang() {
    if (count != 0) {
      count = count--;
    }
  }

//==============RxString=================
  void updateDataString() {
    dataString.value = 'halo (update)';
  }

  void resetDataString() {
    dataString.value = 'halo';
  }

  //==============RxDouble=================
  // untuk data RxDouble , harus mengakses value nya
  // kalo RxInt , bisa langsung variabel nya
  void tambahDataDouble() {
    dataDouble.value++;
  }

  void kurangDataDouble() {
    if (dataDouble.value != 0) {
      dataDouble.value--;
    }
  }

  //==============RxBool=================
  // toggle digunakan untuk mengubah nilai boolean , menjadi lawannya.
  // true diubah ke false
  // false  diubah ke true
  void gantiBoolean() {
    dataBoolean.toggle();
  }
}
