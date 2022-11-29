import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const CacheApp());
}

class CacheApp extends StatelessWidget {
  const CacheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cache Network Image',
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          padding: const EdgeInsets.all(20),
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            children: [
              CachedNetworkImage(
                key: UniqueKey(),
                height: 400,
                width: 400,
                fit: BoxFit.cover,
                imageUrl: "https://i.picsum.photos/id/237/536/354.jpg?hmac=i0yVXW1ORpyCZpQ-CknuyV-jbtU7_x9EBQVhvT5aRr0",
                // imageBuilder: (context, imageProvider) => Container(
                //   height: 300,
                //   width: 300,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: imageProvider,
                //       fit: BoxFit.cover,
                //       colorFilter: const ColorFilter.mode(
                //         Colors.red,
                //         BlendMode.colorBurn,
                //       ),
                //     ),
                //   ),
                // ),
                placeholder: (context, url) => const SizedBox(
                  height: 300,
                  width: 300,
                  child: Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator())),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
