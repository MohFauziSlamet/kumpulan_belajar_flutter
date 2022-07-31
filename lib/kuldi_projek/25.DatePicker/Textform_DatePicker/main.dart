import 'package:belajar_flutter/kuldi_projek/25.DatePicker/Textform_DatePicker/pages/new_taks_form.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Field"),
        ),
        body: Container(
          child:
              Padding(padding: const EdgeInsets.all(8.0), child: NewTaskForm()),
        ),
      ),
    );
  }
}

// class HalamanDate extends StatefulWidget {
//   @override
//   _HalamanDateState createState() => _HalamanDateState();
// }

// class _HalamanDateState extends State {
//   DateTime selectedDate = DateTime.now();
//   _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate, // Refer step 1
//       firstDate: DateTime(2000),
//       lastDate: DateTime(3000),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Halaman Datepicker"),
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Text(
//                 selectedDate.toString(),
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 _selectDate(context);
//               },
//               child: Text('Pilih Tanggal'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
