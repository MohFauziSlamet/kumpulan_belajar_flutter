import 'package:belajar_flutter/kuldi_projek/26.StateManagementProvider/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    //  kita pasang juga provider sbg listener , yang mendengarkan class product
    //  jadi , setiap, apa yang terjadi pada class product ,
    // class ProductItem akan tahu.
    //  lalu kita masukan kedalam variabel
    final productData = Provider.of<Product>(context, listen: false);
    // provider yang ni kita set listennya menjadi false , artinya cuma mengambil data saja , dan tidak menerima perubahan
    // karena data yang berubah hanya icon, dan sudah di tangani oleh consumer .
    // tujuannya , agar yang di render ulang hanya icon yang membutuhkan perubahan saja.
    // hal ini bisa meringankan memory yang dipakai
    print("widget rebuild");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          // consumer <product> sama dengan
          // final productData = Provider.of<Product>(context);
          // yang membedakan final productData = Provider.of<Product>(context); , ini listennya
          // bisa di set false maupun true . kalo false artinya tidak mendengarkan perubahan
          // sedangkan consumer , listennya always true . artinya selalu mendengarkan perubahan yang ada pada provider
          leading: Consumer<Product>(
            builder: (context, value, child) {
              return IconButton(
                icon: (productData.isFavorite)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.amber,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.amber,
                      ),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  // merubah tampilan button icon
                  productData.statusFav();
                },
              );
            },
          ),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
