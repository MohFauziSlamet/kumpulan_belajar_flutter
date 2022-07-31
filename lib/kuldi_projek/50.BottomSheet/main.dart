import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BottomSheetApp());
}

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Bottom Sheet'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Bottom Shet',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            showModalBottomSheet(
              // warna bottom sheet
              backgroundColor: Colors.white,

              // warna layar bawahnya bottom sheet
              barrierColor: Colors.black45,

              // efek shadow
              elevation: 5,

              // memberikan efek lengkung
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              // jika true : bisa close dengan klik belakang layar
              // jika false: tidak bisa close walau diklik dibelakang layar
              isDismissible: false,

              context: context,
              builder: (context) {
                return SizedBox(
                  height: 300,
                  child: ListView(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.cancel_outlined),
                        title: const Text('Cancel'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
