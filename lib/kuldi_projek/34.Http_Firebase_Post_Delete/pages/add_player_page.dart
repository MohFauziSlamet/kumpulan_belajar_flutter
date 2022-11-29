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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Mahasiswa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // data controller
              // nama
              // nim
              // tempat Lahir
              // Tanggal Lahir
              // Fakultas
              // jurusan
              // image
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

                  Navigator.pop(context);
                },
              );
            },
          ),
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
                onEditingComplete: () {
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

                      Navigator.pop(context);
                    },
                  );
                },
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
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
                    );
                  },
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
