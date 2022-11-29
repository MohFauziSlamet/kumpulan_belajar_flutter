import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int number = 0;

  // WidgetsBindingObserver , kita menggunakan ini , agar dapat mengakses fungsi" aplikasi lifecycle

  @override
  void initState() {
    super.initState();
    // agar dapat menggunakan aplikasi lifecycle , kita juga harus menambhakan initState , yang didalam nya
    // ada  WidgetsBinding.instance?.addObserver(this);
    WidgetsBinding.instance.addObserver(this);

    // AppLifecycleState.inactive => terjadi ketika aplikasi sedang proses di minimmize
    // AppLifecycleState.paused => terjadi ketika aplikasi sudah di minimmize
    // AppLifecycleState.resumed => terjadi ketika aplikasi sudah aktif lagi
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);

    switch (state) {
      case AppLifecycleState.inactive:
        // your code ...
        setState(() {
          number = 99;
        });
        break;

      case AppLifecycleState.paused:
        // your code ...
        setState(() {
          number = 66;
        });
        break;

      case AppLifecycleState.resumed:
        // your code ...
        setState(() {
          number = 33;
        });

        break;

      case AppLifecycleState.detached:
        // your code ...
        break;
      default:
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    // ini  bertujuan , agar ketika aplikasi di minimize , tidak memakan memori hp pengguna
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan App Lifcycle"),
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 35),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
