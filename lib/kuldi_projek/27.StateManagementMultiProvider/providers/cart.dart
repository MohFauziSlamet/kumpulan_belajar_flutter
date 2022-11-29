import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  // didlm provider ini , kita akan membuat fungsi,
  // ketika icon cart(keranjang)di klik , akan otomatis terisi 1 produk.
  // jika produk diklik dua kali , maka yang muncul hanya 1. namun yang bertambah hanya qty nya .
  // jumlah akan bertambah , ketika meng klik produk yang beda .
  // data akan kita maping (type map) , dengan komposisi key = value
  // key nya akan kita buat dengan id dari productId
  // value nya , kita ambil dari model CartItem , yang berisi 4 field wajib isi(required)

  //  kita buat private
  final Map<String, CartItem> _items = {};

  // lalu kita buat getter
  Map<String, CartItem> get items => _items;

  //kita buat methode get baru untuk mendapatkan jumlah qty yang telah diinputkan
  int get jumlah {
    return _items.length;
  }

  // kita buat getter untuk mendapatkan total harga

  double get totalHarga {
    var total = 0.0;

    // kita butuh melooping items , untuk mendapatkan keseluruhan data yang ada pada Cart
    _items.forEach((key, CartItem) {
      // total ditambah(qty dikali dengan harga)
      total += CartItem.price * CartItem.qty;
    });
    return total;
  }

  // kita buat methode , agar ketika icon.cart diklik
  // otomatis menambahkan product kedalam maping
  // kita membutuhkan 3 parameter
  void addCart(
    String productId,
    String title,
    double price,
  ) {
    // kita akan menambahkan product kedalam Cart
    // jika terdapat dua kondisi
    // pertama, ketika kita pertama kali mendaftarkan productId kedalam CartItem.
    // kedua , ketika kita akan menambahkan qty , dari cart yang telah ditambahkan sebelumnya

    // kita butuh mengecek , apakah key sudah pernah ditambahkan apa belum
    // kita dapat menggunakan methode yang sudah ada , yaitu
    // containsKey() , ini artinya
    // Apakah map ini berisi [key] yang diberikan.
    // Mengembalikan benar jika salah satu kunci dalam map sama dengan kunci sesuai dengan kesetaraan
    //  yang digunakan oleh map
    if (items.containsKey(productId)) {
      // ketika sudah ada key value dari productId(nambah qty)

      // Memperbarui nilai untuk [kunci] yang disediakan.

      // kita dibantu dengan fungsi update , untuk mengupdate nilai yang ada didalam maping
      // Mengembalikan nilai baru yang terkait dengan key.
      // Jika key hadir, panggil [update] dengan nilai saat ini dan menyimpan nilai baru dalam map.
      // Jika kunci tidak ada dan [ifAbsent] disediakan, panggil [ifAbsent] dan tambahkan kunci dengan nilai yang dikembalikan ke map.
      // Jika kuncinya tidak ada, [ifAbsent] harus disediakan.
      _items.update(
          productId,
          (value) => CartItem(
              // dari data yang diambil oleh fungsi update , kita akan perbarui yang kita perlukan saja
              // jadi data yang diisi wajib dari value , bukan parameter lagi. karena parameter hanya digunakan
              // untuk memasukan data product baru .
              // disini kita akan merubah qty nya saja .
              id: value.id,
              price: value.price,
              title: value.title,
              qty: value.qty + 1));
    } else {
      // ketika akan menambahkan productId baru
      // dengan cara , kita akan membuat maping , karena tempat penampungnya berupa maping.
      // methode putIfAbsent , kita akan menambahkan maping baru kedalam _items ,
      // jika idnya belum pernah ditambahkan .
      // Cari nilai [key], atau tambahkan entri baru jika tidak ada.
      // Mengembalikan nilai yang terkait dengan [kunci], jika ada.
      // Jika tidak, panggil [ifAbsent] untuk mendapatkan nilai baru.

      // karena id nya baru, kita buat datetime.now
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }

    // jangan lupa menambahkan
    notifyListeners();
    // untuk memberitahu jika ada perubahan
  }

  removeCart(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              title: value.title,
              qty: value.qty - 1));
    }
    // _items.remove(
    //   (key, value) => value(id: value.id),
    // );

    notifyListeners();
  }
}
