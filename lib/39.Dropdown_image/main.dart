import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const CustomButtonTest());
}

// class CustomButtonTest extends StatefulWidget {
//   const CustomButtonTest({Key? key}) : super(key: key);

//   @override
//   State<CustomButtonTest> createState() => _CustomButtonTestState();
// }

// class _CustomButtonTestState extends State<CustomButtonTest> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton2(
//               customButton: Container(
//                 height: 240,
//                 width: 240,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/mauludy2.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               openWithLongPress: true,
//               customItemsHeights: [
//                 ...List<double>.filled(MenuItems.firstItems.length, 48),
//                 8,
//                 ...List<double>.filled(MenuItems.secondItems.length, 48),
//               ],
//               items: [
//                 ...MenuItems.firstItems.map(
//                   (item) => DropdownMenuItem<MenuItem>(
//                     value: item,
//                     child: MenuItems.buildItem(item),
//                   ),
//                 ),
//                 const DropdownMenuItem<Divider>(
//                     enabled: false, child: Divider()),
//                 ...MenuItems.secondItems.map(
//                   (item) => DropdownMenuItem<MenuItem>(
//                     value: item,
//                     child: MenuItems.buildItem(item),
//                   ),
//                 ),
//               ],
//               onChanged: (value) {
//                 MenuItems.onChanged(context, value as MenuItem);
//               },
//               itemHeight: 48,
//               itemPadding: const EdgeInsets.only(left: 16, right: 16),
//               dropdownWidth: 160,
//               dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
//               dropdownDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 color: Colors.redAccent,
//               ),
//               dropdownElevation: 8,
//               offset: const Offset(40, -4),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MenuItem {
//   final String text;
//   final IconData icon;

//   const MenuItem({
//     required this.text,
//     required this.icon,
//   });
// }

// class MenuItems {
//   static const List<MenuItem> firstItems = [like, share, download];
//   static const List<MenuItem> secondItems = [cancel];

//   static const like = MenuItem(text: 'Like', icon: Icons.favorite);
//   static const share = MenuItem(text: 'Share', icon: Icons.share);
//   static const download = MenuItem(text: 'Download', icon: Icons.download);
//   static const cancel = MenuItem(text: 'Cancel', icon: Icons.cancel);

//   static Widget buildItem(MenuItem item) {
//     return Row(
//       children: [
//         Icon(
//           item.icon,
//           color: Colors.white,
//           size: 22,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Text(
//           item.text,
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   static onChanged(BuildContext context, MenuItem item) {
//     switch (item) {
//       case MenuItems.like:
//         //Do something
//         break;
//       case MenuItems.share:
//         //Do something
//         break;
//       case MenuItems.download:
//         //Do something
//         break;
//       case MenuItems.cancel:
//         //Do something
//         break;
//     }
//   }
// }

class CustomButtonTest extends StatefulWidget {
  const CustomButtonTest({Key? key}) : super(key: key);

  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              customButton: Container(
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/mauludy2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              items: [
                DropdownMenuItem(child: MenuItems.buildItem(MenuItems.logout))
              ],
              onChanged: (dynamic value) {
                log('LOGOUT');
              },
              itemHeight: 48,
              itemPadding: const EdgeInsets.only(left: 16, right: 16),
              dropdownWidth: 160,
              dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.redAccent,
              ),
              dropdownElevation: 8,
              offset: const Offset(0, 8),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> secondItems = [logout];

  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context) {
    log('LOG OUT');
  }
}
