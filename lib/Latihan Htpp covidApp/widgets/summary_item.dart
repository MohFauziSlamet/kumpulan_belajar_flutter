import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  // menambahkan beberapa variabel penampung title dan value
  String title;
  String value;

  SummaryItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
