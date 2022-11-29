import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class AddPlayer extends StatelessWidget {
  //
  static const routeName = "/add-player";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController fakultasController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    final allMahasiswa = Provider.of<AllMahasiswa>(context, listen: false);

    // ignore: prefer_function_declarations_over_variables
    final addMahasiswa = () {
      // jika berhasil maka ke then
      // jika ada error maka ke catchError
      allMahasiswa
          .addMahasiswa(
        nameController.text,
        nimController.text,
        tempatLahirController.text,
        tanggalLahirController.text,
        fakultasController.text,
        jurusanController.text,
      )
          .then(
        (response) {
          // menambahkan notif
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Berhasil ditambahkan"),
              duration: Duration(seconds: 2),
            ),
          );
          // kita masukan pop kedalam then
          // agar , pop dijalnkan setelah keseluruhan add selesai dijalnkan
          print("sudah kembali ke home");
          Navigator.pop(context);
        },
      ).catchError(
        (err) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Telah Terjadi Error $err"),
              content: const Text("Tidak dapat menambahkan Mahasiswa"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Oke"),
                ),
              ],
            );
          },
        ),
      );
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Mahasiswa"),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: addMahasiswa),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama Lengkap"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Nim"),
                textInputAction: TextInputAction.next,
                controller: nimController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Tempat Lahir"),
                textInputAction: TextInputAction.next,
                controller: tempatLahirController,
              ),
              const DatePicker(),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Tanggal Lahir"),
                textInputAction: TextInputAction.next,
                controller: tanggalLahirController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Fakultas"),
                textInputAction: TextInputAction.next,
                controller: fakultasController,
              ),
              TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Jurusan"),
                  textInputAction: TextInputAction.done,
                  controller: jurusanController,
                  onEditingComplete: addMahasiswa),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: addMahasiswa,
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
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

// nama
// nim
// tempat Lahir
// Tanggal Lahir
// Fakultas
// jurusan
// image

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
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
        child: const Text("Pilih Tanggal lahir anda"),
      ),
    );
  }
}
