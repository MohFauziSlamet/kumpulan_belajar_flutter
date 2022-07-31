import 'package:flutter/material.dart';

class GridviewAplikasi extends StatelessWidget {
  const GridviewAplikasi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        leading: const FlutterLogo(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: 60,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 150,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 150,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
