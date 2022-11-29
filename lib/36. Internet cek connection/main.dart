import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

void main(List<String> args) {
  runApp(const CheckConnection());
}

class CheckConnection extends StatelessWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OverlaySupport.global(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasInternet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Connectivity'),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await InternetConnectionChecker().hasConnection;

            final text = hasInternet ? 'Internet' : 'No Internet';
            final color = hasInternet ? Colors.green : Colors.red;

            showSimpleNotification(
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              background: color,
            );
          },
          child: const Text('Check Internet'),
        ),
      ),
    );
  }
}
