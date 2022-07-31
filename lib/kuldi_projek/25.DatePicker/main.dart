import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;

    // mendapatkan tinggi app bar
    final myAppBar = AppBar(
      title: const Text(
        "Latihan Date picker time",
      ),
      centerTitle: true,
    );

    // tinggi body
    final bodyHeightApp = heightApp -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectDate.toString(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: selectDate,
                  // firstDate tahun awal nya berapa dan tahun berakhir nya berapa
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2030),
                  // secara default . showDatePicker akan menampilkan DatePickerEntryMode.calendar
                  // initialEntryMode: DatePickerEntryMode.calendar,
                  // initialEntryMode: DatePickerEntryMode.calendarOnly,
                  // initialEntryMode: DatePickerEntryMode.input,
                  // initialEntryMode: DatePickerEntryMode.inputOnly,

                  // didalam showDatePicker , default nya menggunakan initialDatePickerMode :
                  //  DatePickerMode.day
                  // initialDatePickerMode: DatePickerMode.day,
                  // initialDatePickerMode: DatePickerMode.year,

                  // membuat range yang bisa di select ,
                  // jadi tidak semua tangggal bisa dipilih
                  selectableDayPredicate: (day) {
                    if ((day.isAfter(
                          DateTime.now().subtract(
                            const Duration(
                              days: 3,
                            ),
                          ),
                        )) &&
                        (day.isBefore(
                          DateTime.now().add(
                            const Duration(
                              days: 3,
                            ),
                          ),
                        ))) {
                      return true;
                    }
                    return false;
                  },

                  //
                  // helpText: "help Text", =>  Date select
                  // cancelText: "cancel Text",  =>  cancel
                  // confirmText: "confirm Text",  =>  ok
                  // fieldHintText: "field Hint Text",  =>  mm/dd/yyy
                  // fieldLabelText: "field Label Text",  =>  enter date
                  // errorFormatText: "FORMAT SALAH",  =>  invalid format

                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
                ).then(
                  (value) {
                    if (value != null) {
                      setState(
                        () {
                          selectDate = value;
                        },
                      );
                    }
                  },
                );
              },
              child: const Text("Date Picker"),
            ),
          ],
        ),
      ),
    );
  }
}
