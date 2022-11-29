import 'package:flutter/material.dart';
// import 'widgets/soal_hello_world_1.dart'; // soal 1
// import 'widgets/soal_hello_world_2.dart';  // soal 2
// import 'widgets/soal_3_flutter_logo.dart'; // soal 3
// import 'widgets/soal_4_flutter_logo.dart'; // soal 4
// import 'widgets/soal_5_container.dart'; // soal 5
// import 'widgets/soal_6_container_circle.dart'; // soal 6
// import 'widgets/soal_7_row_container.dart'; // soal 7
// import 'widgets/soal_8_row_container_spacebeetwen.dart'; // soal 8
// import 'widgets/soal_9_row_container_end.dart'; // soal 9
// import 'widgets/soal_10_column_container.dart'; // soal 10
// import 'widgets/soal_11_column_container_spaceBeetwen.dart'; // soal 11
// import 'widgets/soal_12_column_4container.dart'; // soal 12
// import 'widgets/soal_13_column_4container_spacebeween.dart'; // soal 13
// import 'widgets/soal_14_row_column_4container_spacebeween .dart'; // soal 14
// import 'widgets/soal_15_row_column_4container_logo .dart'; // soal 15
// import 'widgets/soal_16_row_column_4container.dart'; // soal 16
// import 'widgets/soal_17_gridview.dart'; // soal 17
// import 'widgets/soal_18_listview_builder.dart'; // soal 18
// import 'widgets/soal_19_listview_builder_image.dart'; // soal 19
// import 'widgets/soal_20_stack.dart'; // soal 20
// import 'widgets/soal_21_stack_center.dart'; // soal 21
// import 'widgets/soal_22_center_circle.dart'; // soal 22
// import 'widgets/soal_23_center_circle _helo.dart'; // soal 23
import 'widgets/soal_24_row_column_advance.dart'; // soal 24

void main(List<String> args) {
  runApp(const HelloApp());
}

class HelloApp extends StatelessWidget {
  const HelloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SoalHelloWorld(), // soal nomor 1
      // home: SoalHelloWorldCustom(), // soal nomor 2
      // home: FlutterLogoLatihan(), // soal nomor 3
      // home: FlutterLogoLatihanCustom(), // soal nomor 4
      // home: ContaineText(), // soal nomor 5
      // home: ContaineTextCircle(), // soal nomor 6
      // home: RowContainer(), // soal nomor 7
      // home: RowContainerSpaceBeetwen(), // soal nomor 8
      // home: RowContainerEnd(), // soal nomor 9
      // home: ColumnContainer(), // soal nomor 10
      // home: ColumnContainerSpaceBetween(), // soal nomor 11
      // home: ColumnEmpatContainer(), // soal nomor 12
      // home: ColumnEmpatContainerSpaceBetween(), // soal nomor 13
      // home: RowColumnEmpatContainerSpaceBetween(), // soal nomor 14
      // home: RowColumnSpaceBetweenLogo(), // soal nomor 15
      // home: RowColumnSpaceBetweenLogo(), // soal nomor 16
      // home: GridviewAplikasi(), // soal nomor 17
      // home: ListviewAplikasi(), // soal nomor 18
      // home: ListviewAplikasiImage(), // soal nomor 19
      // home: StackApp(), // soal nomor 20
      // home: StackCenter(), // soal nomor 21
      // home: CenterCircle(), // soal nomor 22
      // home: CenterCircleHello(), // soal nomor 23
      home: RowColumnAdvance(), // soal nomor 24
    );
  }
}
