import 'package:flutter/material.dart';

class ListviewAplikasiImage extends StatelessWidget {
  const ListviewAplikasiImage({
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
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://picsum.photos/id/${870 + index}/200/300'),
                ),
              ),
              child: Text(
                'Hello ${index + 1}',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
