import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../pages/detail_player_page.dart';
import '../pages/add_player_page.dart';

import '../providers/players.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  // methode didalam initState akan dijalankan , sebelum menampilkan aplikasi
  // atau sebelum perintah perintah lain dijalan kan , seperti scaffold dll
  // dengan adanya initstate , kita tidak perlu mengklik tombol lagi , untuk manampilkan data
  // void initState() {
  //   Provider.of<AllMahasiswa>(context).initialData();
  //   super.initState();
  // }

  // karena didalam init state tidak boleh ada context , maka akan error
  // dan sbg ganti nya kita bisa menggunakan didChangeDependencies
  // dan memasukan provider kedalam didChangeDependencies
  // didalam didChangeDependencies diboleh kan ada context
  // namun ada kelamahan didalam didChangeDependencies , dia akan memanggil data
  // terus terusan , tidak ada berhentinya
  // cara nya kita buat pengkondisian , untuk memberhentikannya
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<AllMahasiswa>(context).initialData();
    }

    // setelah dijalankan pengambilan datanya ,
    // kita rubah isInit menjadi false
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //
    final allMahasiswaProvider = Provider.of<AllMahasiswa>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlayer.routeName);
            },
          ),

          // ini sudah digantikan dengan  didChangeDependencies
          // sehingga tidak perlu mengklik lagi untuk mendapatkan data
          // IconButton(
          //   icon: Icon(Icons.remove_red_eye_sharp),
          //   onPressed: () {
          //     setState(() {
          //       allMahasiswaProvider.initialData().then((_) {
          //         // tujuan setstate ini untuk merefresh tampilan ,
          //         // agar data yang sudah di ambil dapat tampil di layar
          //         setState(() {});
          //       });
          //     });
          //   },
          // ),
        ],
      ),
      body: (allMahasiswaProvider.jumlahMahasiswa == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddPlayer.routeName);
                    },
                    child: Text(
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
                  leading: CircleAvatar(
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
                        child: Text("Nim : " +
                            allMahasiswaProvider.allMahasiswa[index].nim),
                      ),
                      Container(
                        child: Text("Tempat Lahir : " +
                            allMahasiswaProvider
                                .allMahasiswa[index].tempatLahir),
                      ),
                      Container(
                        child: Text("Tanggal Lahir : " +
                            allMahasiswaProvider
                                .allMahasiswa[index].tanggalLahir),
                      ),
                      Container(
                        child: Text("Fakultas : " +
                            allMahasiswaProvider.allMahasiswa[index].fakultas),
                      ),
                      Container(
                        child: Text("Jurusan: " +
                            allMahasiswaProvider.allMahasiswa[index].jurusan),
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
                      print("Berhasil dihapus");
                      allMahasiswaProvider.deleteMahasiswa(id).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Berhasil dihapus"),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (allMahasiswaProvider.jumlahMahasiswa >= 1) {
            allMahasiswaProvider.deleteAllMahasiswa().then(
              (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Berhasil dihapus semua"),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
            );
          }
        },
        child: (allMahasiswaProvider.jumlahMahasiswa == 0)
            ? Icon(Icons.no_accounts)
            : Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
