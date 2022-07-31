import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/http_provider.dart';

import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: HomePage(),
      ),
    );
  }
}
