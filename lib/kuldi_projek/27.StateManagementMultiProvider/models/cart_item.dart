class CartItem {
  // menambahkan field field yang dibutuhkan dalam cart nanti
  String id;
  double price;
  String title;

  int qty;

  CartItem(
      {required this.id,
      required this.price,
      required this.title,
      required this.qty});
}


// selanjutnya kita buat provider , dengan namna cart.dart 