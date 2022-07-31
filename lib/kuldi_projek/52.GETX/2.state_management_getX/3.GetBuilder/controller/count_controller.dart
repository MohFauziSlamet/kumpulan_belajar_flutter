import 'package:get/get.dart';

// catatan
// didalam update merupakan list of id
// shg bisa lebih dari 1 id yang bisa dimasukan

class CountController extends GetxController {
  int counter = 0;

  void add() {
    counter++;
    update();
  }

  void mines() {
    if (counter != 0) {
      counter--;
      update();
    }
  }
}
