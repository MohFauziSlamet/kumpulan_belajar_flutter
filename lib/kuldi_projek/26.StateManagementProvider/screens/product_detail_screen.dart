import 'package:belajar_flutter/kuldi_projek/26.StateManagementProvider/providers/all_produtcs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    //mengambil data id dari routing yang masuk
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    final product = Provider.of<Produtcs>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
          )
        ],
      ),
    );
  }
}
