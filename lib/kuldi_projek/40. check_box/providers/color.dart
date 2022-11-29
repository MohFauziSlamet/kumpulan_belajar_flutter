import 'package:flutter/material.dart';

class SingleColor with ChangeNotifier {
  String id, title;
  bool status;

  SingleColor({
    required this.id,
    required this.title,
    this.status = false,
  });

  // untuk merubah status dari check box
  // jika true , maka akan diceklis
  void toogleStatus() {
    status = !status;

    // selanjutnya kita tambahkan notifyListeners
    // agar data dapat di update , pada widget yang me listen nya
    notifyListeners();
  }
}
