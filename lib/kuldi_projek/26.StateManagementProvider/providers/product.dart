// mengubah sebuah model , yang memilik sifat provider
// caranya tinggal kita tambahkan dengan keyword with ChangeNotifier
// atau dalam dart namanya mixin (menambahkan suatu sifat)
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  //kita buat function untuk merubah status dari isFavorite
  void statusFav() {
    isFavorite = !isFavorite;

    // agar dapat didengar oleh si listener (ChangeNotifierProvider)
    // kita perlu memberitahu nya , dengan methode
    notifyListeners();

    // penggunaan notifyListeners , hampir sama dengan set state pada statefull
    // beda nya , notifyListeners berapa pada provider.
    // jadi , baik state less maupun state full , bisa memakaianya
    // skalipun state less , bisa dapat merefresh tampilan dengan notifyListeners
  }
}
