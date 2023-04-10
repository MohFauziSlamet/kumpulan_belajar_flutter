import 'dart:io';

import 'package:belajar_flutter/61.%20Responsie%20login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<File>? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? imagePicker = await picker.pickMultiImage();

    if (imagePicker != null) {
      if (imagePicker.length > 5) {
        image = imagePicker.map((e) => File(e.path)).toList().sublist(0, 4);
      } else {
        image = imagePicker.map((e) => File(e.path)).toList();
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Image"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                if (image != null) ...[
                  for (File img in image!)
                    Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.amber,
                      height: 70,
                      width: 70,
                      child: Image.file(
                        img,
                        fit: BoxFit.cover,
                      ),
                    )
                ],
              ],
            ),

            /// button
            ElevatedButton(
              onPressed: () async {
                await getImage();
              },
              child: Text("Pick Image"),
            )
          ],
        ),
      ),
    );
  }
}
