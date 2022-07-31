import 'package:belajar_flutter/kuldi_projek/26.StateManagementProvider/providers/all_produtcs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Produtcs();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber),
          fontFamily: 'Lato',
        ),

        // kita pasang provider pada home
        // kita bisa bungkus ProductsOverviewScreen dengan ChangeNotifierProvider
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
