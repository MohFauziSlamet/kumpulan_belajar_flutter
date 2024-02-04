import 'package:belajar_flutter/kuldi_projek/BLOC/9_generated_route_access/routes/app_routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => MyRouters().appsRouters(settings),
    );
  }
}
