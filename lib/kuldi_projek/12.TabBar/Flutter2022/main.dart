import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TabbarApp());
}

class TabbarApp extends StatelessWidget {
  const TabbarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Whatsapps'),
            actions: const [
              Icon(Icons.search),
              SizedBox(width: 20),
              Icon(Icons.menu),
            ],
            backgroundColor: Colors.teal,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  text: 'Chats',
                ),
                Tab(
                  text: 'Status',
                ),
                Tab(
                  text: 'Calls',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Camera'),
              ),
              Center(
                child: Text('Chats'),
              ),
              Center(
                child: Text('Status'),
              ),
              Center(
                child: Text('Calls'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
