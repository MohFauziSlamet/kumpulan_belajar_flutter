import 'package:belajar_flutter/kuldi_projek/26.StateManagementProvider/widgets/produtc_grid.dart';
import 'package:flutter/material.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        centerTitle: true,
      ),
      body: ProdutcGrid(),
    );
  }
}
