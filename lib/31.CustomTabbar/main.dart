import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const CustomTabbar());
}

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt current = 0.obs;

    List<String> items = [
      "Home",
      "Explore",
      "Search",
      "Feed",
      "Post",
      "Activity",
      "Setting",
      "Profile",
    ];
    List<IconData> icons = [
      Icons.home,
      Icons.explore,
      Icons.search,
      Icons.feed,
      Icons.post_add,
      Icons.local_activity,
      Icons.settings,
      Icons.person,
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          title: const Text(
            "Custom Tabbar",
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Obx(() => InkWell(
                              onTap: () {
                                current.value = index;
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current.value == index
                                      ? Colors.deepPurple[200]
                                      : Colors.white54,
                                  borderRadius: BorderRadius.circular(
                                      current.value == index ? 17 : 10),
                                  border: current.value == index
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: GoogleFonts.laila(
                                      fontWeight: current.value == index
                                          ? FontWeight.w500
                                          : FontWeight.w300,
                                      color: current.value == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Obx(
                          () => Visibility(
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: current.value == index
                                    ? Colors.deepPurple
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              ///
              Obx(() => Container(
                    height: Get.height * 0.7,
                    width: Get.width,
                    color: Colors.amber,
                    child: Center(
                      child: Icon(
                        icons[current.value],
                        color: Colors.deepPurple,
                        size: 200,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
