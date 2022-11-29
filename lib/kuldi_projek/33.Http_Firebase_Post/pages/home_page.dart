import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../pages/detail_player_page.dart';
import '../pages/add_player_page.dart';

import '../providers/players.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final allMahasiswaProvider = Provider.of<AllMahasiswa>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlayer.routeName);
            },
          ),
        ],
      ),
      body: (allMahasiswaProvider.jumlahMahasiswa == 0)
          ? SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddPlayer.routeName);
                    },
                    child: const Text(
                      "Tambah Data Mahasiswa",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allMahasiswaProvider.jumlahMahasiswa,
              itemBuilder: (context, index) {
                var id = allMahasiswaProvider.allMahasiswa[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPlayer.routeName,
                      arguments: id,
                    );
                  },
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/person-icon.png"),
                    // backgroundImage: NetworkImage(
                    //   allMahasiswaProvider.allMahasiswa[index].imageUrl,
                    // ),
                  ),
                  title: Text(
                    allMahasiswaProvider.allMahasiswa[index].name,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Nim : ${allMahasiswaProvider.allMahasiswa[index].nim}"),
                      ),
                      Container(
                        child: Text("Tempat Lahir : ${allMahasiswaProvider
                                .allMahasiswa[index].tempatLahir}"),
                      ),
                      Container(
                        child: Text("Tanggal Lahir : ${allMahasiswaProvider
                                .allMahasiswa[index].tanggalLahir}"),
                      ),
                      Container(
                        child: Text("Fakultas : ${allMahasiswaProvider.allMahasiswa[index].fakultas}"),
                      ),
                      Container(
                        child: Text("Jurusan: ${allMahasiswaProvider.allMahasiswa[index].jurusan}"),
                      ),
                      Container(
                        child: Text(
                          DateFormat.yMMMMd().format(allMahasiswaProvider
                              .allMahasiswa[index].createdAt),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      allMahasiswaProvider.deleteMahasiswa(id, context);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
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