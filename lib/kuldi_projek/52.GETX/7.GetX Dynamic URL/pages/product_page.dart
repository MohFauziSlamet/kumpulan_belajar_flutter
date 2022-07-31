import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_name.dart';

// catatan
// Dynamic Url
// Url bisa diubah sesuai dengan data yang mau kita bawa ke page tujuan
// dengan menambahkan /:namaId/:namaProduk dll
// atau juga bisa menggunakan tanda tanya (?) selanjutnya bisa menambahkan
// beberapa parameters , dan jika ingin menambahkan parameters lain , cukup
// disambung dengan simbol & (dan)
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteNames.productPage + '/1?name=Jaket&ukuran=XL');
              },
              child: Text('Product-1 '),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteNames.productPage + '/2?name=Kemeja&ukuran=L');
              },
              child: Text('Product-2 '),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteNames.productPage + '/3?name=Baju&ukuran=L');
              },
              child: Text('Product-3 '),
            ),
          ],
        ),
      ),
    );
  }
}
