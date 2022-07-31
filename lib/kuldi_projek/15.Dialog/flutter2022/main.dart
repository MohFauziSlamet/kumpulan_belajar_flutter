import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const DialogApp());
}

class DialogApp extends StatelessWidget {
  const DialogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Dialog'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text('Ini adalah title'),
                    content: const Text('ini adalah content'),
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Oke'),
                      ),
                    ],
                  );
                },
              );
            });
          },
          child: const Text('Dialog Button'),
        ),
      ),
    );
  }
}
