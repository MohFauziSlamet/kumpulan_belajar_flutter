import 'package:flutter/material.dart';
import '../models/player.dart';

class AllMahasiswa with ChangeNotifier {
  final List<Mahasiswa> _allMahasiswa = [];

  List<Mahasiswa> get allMahasiswa => _allMahasiswa;

  int get jumlahMahasiswa => _allMahasiswa.length;

  Mahasiswa selectById(String id) =>
      _allMahasiswa.firstWhere((element) => element.id == id);

  //
  void addMahasiswa(
      String name,
      String nim,
      String tempatLahir,
      String tanggalLahir,
      String fakultas,
      String jurusan,
      String image,
      BuildContext context) {
    DateTime datetimeNow = DateTime.now();
    _allMahasiswa.add(
      Mahasiswa(
        id: datetimeNow.toString(),
        name: name,
        nim: nim,
        tempatLahir: tempatLahir,
        tanggalLahir: tanggalLahir,
        fakultas: fakultas,
        jurusan: jurusan,
        imageUrl: image,
        createdAt: datetimeNow,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil ditambahkan"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  //  edit mahasiswa
  void editMahasiswa(
      String id,
      String name,
      String nim,
      String tempatLahir,
      String tanggalLahir,
      String fakultas,
      String jurusan,
      String image,
      BuildContext context) {
    Mahasiswa selectMahasiswa =
        _allMahasiswa.firstWhere((element) => element.id == id);
    selectMahasiswa.name = name;
    selectMahasiswa.nim = nim;
    selectMahasiswa.tempatLahir = tempatLahir;
    selectMahasiswa.tanggalLahir = tanggalLahir;
    selectMahasiswa.fakultas = fakultas;
    selectMahasiswa.jurusan = jurusan;
    selectMahasiswa.imageUrl = image;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil diubah"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  //  delete players
  void deleteMahasiswa(String id, BuildContext context) {
    _allMahasiswa.removeWhere((element) => element.id == id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil dihapus"),
        duration: Duration(milliseconds: 500),
      ),
    );
    notifyListeners();
  }
}
// nama 
// nim 
// tempat Lahir
// Tanggal Lahir
// Fakultas
// jurusan
// image 