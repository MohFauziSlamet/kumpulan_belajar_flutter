import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/all_produtcs.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/providers/cart.dart';
import 'package:belajar_flutter/kuldi_projek/27.StateManagementMultiProvider/screens/cart_screen.dart';
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
    return MultiProvider(
      // pengambilan sumber data yang akan digunakan
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Cart();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Produtcs();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber),
          fontFamily: 'Lato',
        ),

        home: ProductsOverviewScreen(),

        //routes untuk menavigasikan page
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

// dibawah merupakan penerapan single provider
// disini kita menambahkan provider lain , jadi solusinya kita memakai,
// multiprovider

//     ChangeNotifierProvider(
//       create: (context) {
//         return Produtcs();
//       },
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'MyShop',
//         theme: ThemeData(
//           primarySwatch: Colors.indigo,
//           colorScheme: ColorScheme.fromSwatch(accentColor: Colors.amber),
//           fontFamily: 'Lato',
//         ),

//         // kita pasang provider pada home
//         // kita bisa bungkus ProductsOverviewScreen dengan ChangeNotifierProvider
//         home: ProductsOverviewScreen(),
//         routes: {
//           ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
//         },
//       ),
//     );
//   }
// }
