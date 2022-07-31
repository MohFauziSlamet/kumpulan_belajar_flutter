import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    required this.icon,
    this.inActive = false,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final bool inActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: inActive == true ? Colors.black : Colors.white,
            width: 1,
          ),
        ),
      ),
      child: Icon(icon),
    ));
  }
}
