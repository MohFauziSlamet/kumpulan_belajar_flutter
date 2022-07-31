import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

/// catatan:
/// options : digunakan untuk menagtur beberapa settingan pada carousel kita,
/// misal , tinggi dari carousel_slider tsb
/// items :Widget yang akan ditampilkan di carousel konstruktor default,
/// item berupa list of wigdet.
/// viewportFraction : Pecahan viewport yang harus ditempati setiap halaman.
/// Default ke 0,8, yang berarti setiap halaman mengisi 80% carousel.
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CarouselWithIndicatorDemo(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Carousel Slider'),
        centerTitle: true,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          viewportFraction: 0.9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.slowMiddle,
          reverse: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
        ),
        items: [1, 2, 3, 4, 5].map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // width: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Center(
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> imageSliders = [
    SizedBox(
      width: Get.width * 0.4,
      height: Get.width * 0.3,
      child: const Image(
        image: AssetImage("assets/images/mauludy.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      width: Get.width * 0.4,
      height: Get.width * 0.3,
      child: const Image(
        image: AssetImage("assets/images/mauludy2.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      width: Get.width * 0.4,
      height: Get.width * 0.3,
      child: const Image(
        image: AssetImage("assets/images/mauludy3.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      width: Get.width * 0.4,
      height: Get.width * 0.3,
      child: const Image(
        image: AssetImage("assets/images/mauludy4.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel with indicator controller demo'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageSliders.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
