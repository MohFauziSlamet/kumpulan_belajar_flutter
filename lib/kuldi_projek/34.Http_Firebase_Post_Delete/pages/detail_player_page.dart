import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class DetailPlayer extends StatelessWidget {
  static const routeName = "/detail-player";

  @override
  Widget build(BuildContext context) {
    //
    final allMahasiswa = Provider.of<AllMahasiswa>(context, listen: false);
    final mahasiswaId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMahasiswa = allMahasiswa.selectById(mahasiswaId);

    final TextEditingController nameController =
        TextEditingController(text: selectMahasiswa.name);
    final TextEditingController nimController =
        TextEditingController(text: selectMahasiswa.nim);
    final TextEditingController tempatLahirController =
        TextEditingController(text: selectMahasiswa.tempatLahir);
    final TextEditingController tanggalLahirController =
        TextEditingController(text: selectMahasiswa.tanggalLahir);
    final TextEditingController fakultasController =
        TextEditingController(text: selectMahasiswa.fakultas);
    final TextEditingController jurusanController =
        TextEditingController(text: selectMahasiswa.fakultas);

    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAIL PLAYER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  // width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    // color: Colors.blue,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/person-icon.png")
                        // image: NetworkImage(imageController.text),
                        ),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama"),
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
                textInputAction: TextInputAction.next,
                controller: jurusanController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Jurusan"),
                textInputAction: TextInputAction.done,
                controller: jurusanController,
                onEditingComplete: () {
                  allMahasiswa.editMahasiswa(
                    mahasiswaId,
                    nameController.text,
                    nimController.text,
                    tempatLahirController.text,
                    tanggalLahirController.text,
                    fakultasController.text,
                    jurusanController.text,
                    context,
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    allMahasiswa.editMahasiswa(
                      mahasiswaId,
                      nameController.text,
                      nimController.text,
                      tempatLahirController.text,
                      tanggalLahirController.text,
                      fakultasController.text,
                      jurusanController.text,
                      context,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Edit",
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
