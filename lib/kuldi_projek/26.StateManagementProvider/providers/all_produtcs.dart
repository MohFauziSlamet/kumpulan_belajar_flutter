import 'dart:math';
import 'package:belajar_flutter/kuldi_projek/26.StateManagementProvider/providers/product.dart';
import 'package:flutter/material.dart';

class Produtcs with ChangeNotifier {
  // kita akan memprovide semua data disini
  // kita buat list of product , yang diambil dari model
  // kita buat private , agar tidak bisa diakses dari luar
  final List<Product> _allProdutcs = List.generate(
    25,
    (index) {
      //model produk
      return Product(
        id: "id ${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  // cara mengkases nya kita buat metode getter ,
  List<Product> get allProdutcs {
    return [..._allProdutcs];
  }

  // fungsi pengambilan data by id
  Product findById(productId) {
    return _allProdutcs.firstWhere((prodId) => prodId.id == productId);
  }

  //
  // void addProdutc() {
  //   //
  //   _allProdutcs.add(value);

  //   // Gunanya notifyListeners
  //   // agar setiap allProdutcs ditambahkan, maka dia akan memberi tau pada screens yang ada methode
  //   // listener, bahwa telah terjadi perubahan (penambahan data),
  //   notifyListeners();
  // }
}
