import 'package:flutter/material.dart';

// mengguakan provider
import 'package:provider/provider.dart';
import './models/http_provider.dart';
import './pages/home_provider.dart';

// menggunakan state full

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeStateful(),
      home: ChangeNotifierProvider(
        // ini pengambilan data dari class
        create: (context) => HttpProvider(),
        // yang akan ditampilkan pertama kali
        child: HomeProvider(),
      ),
    );
  }
}
