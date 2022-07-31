import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  StoryItem({
    required this.title,
    required this.imgUrl,
    Key? key,
  }) : super(key: key);

  String title;
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[300],
                ),
              ),
              Container(
                width: 77,
                height: 77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: AssetImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}
