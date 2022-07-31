import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/all_produtcs.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/cart.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/screens/cart_screen.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    //mengambil data id dari routing yang masuk
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    // mencari id, untuk menampilkan detail produk berdasarkan id yang didapat
    // keyword findById , methode yang digunakan untuk membantu mendapatkan id dari provider
    final product = Provider.of<Produtcs>(context).findById(productId);

    // membuat provider untuk cart
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        // menambahkan icon pada detail screens
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Badge(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CartScreen.routeName,
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
                value: value.jumlah.toString(),
                color: Colors.amber,
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image(
              image: NetworkImage(
                product.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          const SizedBox(
            height: 15,
          ),
          Text(
            " \$ ${product.price.toString()}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          const SizedBox(
            height: 15,
          ),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              // meberikan notif ketika berhasil menambahakn data
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Produk Berhasil Ditambahkan"),
                  duration: Duration(
                    milliseconds: 500,
                  ),
                ),
              );
              // data yang dipakai dari provider productData
              cart.addCart(
                product.id,
                product.title,
                product.price,
              );
            },
            child: const Text(
              "Add to cart",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
