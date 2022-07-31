import 'package:belajar_flutter/kuldi_projek/42.%20Auth/pages/auth_page.dart';
import 'package:belajar_flutter/kuldi_projek/42.%20Auth/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/players.dart';
import './pages/detail_player_page.dart';
import './pages/add_player_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AllMahasiswa(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthPage(),
        ),
      ],
      builder: (context, child) => Consumer<AuthPage>(
        builder: (context, auth, child) {
          print('pengkondisian untuk masuk ke home');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
            routes: {
              AddPlayer.routeName: (context) => AddPlayer(),
              DetailPlayer.routeName: (context) => DetailPlayer(),
            },
          );
        },
      ),
    );
  }
}
