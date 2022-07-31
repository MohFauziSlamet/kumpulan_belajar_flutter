import 'package:flutter/material.dart';

class ListviewAplikasi extends StatelessWidget {
  const ListviewAplikasi({
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
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Helo ${index + 1}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Helo ${index + 1}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
