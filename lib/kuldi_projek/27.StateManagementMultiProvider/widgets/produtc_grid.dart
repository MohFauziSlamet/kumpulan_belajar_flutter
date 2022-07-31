import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/all_produtcs.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutcGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // mengambil data dari provider
    // productData = Provider.of<Produtcs>(context) ini artinya listener
    // kita mendengarkan setiap apa yang terjadi pada provider (yaitu class yang memakai mixin
    //  dengan keyword with ChangeNotifier)
    final productData = Provider.of<Produtcs>(context);

    final allProduct = productData.allProdutcs;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // ketika class sudah ada value , langsung kita gunakan saja value nya
        // hal ini dapat kita check pada class Produtcs , dia memiliki list off allProdutcs
        // allProdutcs merupakan value dari class Product
        value: allProduct[i],

        // create (context){} , kita ganti dengan value .
        // create: (context) {
        //   //  karena kita memiliki variabel yang bertipe class product ,
        //   //  selanjutnya kita lopping menggunakan item builder.
        //   //  jadi i ini adalah indexnya ,
        //   //  jadi semua produk sudah dibungkus dengan ChangeNotifierProvider
        //   return allProduct[i];
        // },
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
