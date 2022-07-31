import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/cart.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/screens/cart_screen.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/widgets/badge.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/widgets/produtc_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        centerTitle: true,
        // menambahkan action button cart
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
      body: ProdutcGrid(),
    );
  }
}
