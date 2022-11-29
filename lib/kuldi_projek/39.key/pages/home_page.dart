import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../pages/add_product_page.dart';
import '../widgets/product_item.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context);
    var allProducts = products.allProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.pushNamed(context, AddProductPage.routeName),
          ),
        ],
      ),
      body: (allProducts.isEmpty)
          ? const Center(
              child: Text(
                "No Data",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          : ListView(
              // cara mengambil data yang beruba list , dengan di bentuk menjadi maping , dan dikembalikan ke list
              // karena ListView berbentuk list
              children: allProducts
                  .map((e) => ProductItem(
                        ValueKey(e.id),
                        e.id,
                        e.title,
                        e.date,
                      ))
                  .toList(),
            ),
    );
  }
}
