import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/player.dart';
import 'package:http/http.dart' as http;

class AllMahasiswa with ChangeNotifier {
  final List<Mahasiswa> _allMahasiswa = [];

  List<Mahasiswa> get allMahasiswa => _allMahasiswa;

  int get jumlahMahasiswa => _allMahasiswa.length;

  Mahasiswa selectById(String id) =>
      _allMahasiswa.firstWhere((element) => element.id == id);

  //
  Future<void> addMahasiswa(
    String name,
    String nim,
    String tempatLahir,
    String tanggalLahir,
    String fakultas,
    String jurusan,
  ) {
    DateTime datetimeNow = DateTime.now();

    // kita connect kan Database , dengan menambhkan url nya
    // kita parse string kedalam uri
    // karena url pada http post bertype Uri
    // Uri => Kelas Uri menyediakan fungsi untuk menyandikan (encode)dan memecahkan (decode )
    // kode string untuk digunakan dalam URI (yang mungkin Anda kenal sebagai URL).
    // Fungsi-fungsi ini menangani karakter yang khusus untuk URI, seperti &dan =.
    // Kelas Uri juga mengurai dan mengekspos komponen URI - host, port, skema, dan sebagainya.
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json");
    // didalam url , kita juga harus menambahkan parameter / segmen / nama file sbg penyimpan data
    // letak di bagian akhir , url . dan berekstensi json

    // ketika menggunakan post , yang artinya menyimpan
    // kita juga harus manambahkan body , didalam body ini berisi data yang akan disimpan
    print("sebelum http");
    return http
        .post(
      url,
      body: json.encode(
        {
          // data yang mau disimpan
          // karena data yang dikirim dalam bentuk mapping (map)
          // maka yang jadi id dll harus dalam bentuk string sebagai key nya , dan sisi nya sbg value
          // "id": datetimeNow.toString(),
          // karena didalam firebase , kita akan dibuatkan id yang unik
          // maka , kita tidak perlu menambahkan id lagi
          // cara mendapatkan id pada firebase , yaitu pada response dari post .
          // ada reques ada response
          // cara nya dengan menambahkan then() , kita bisa memkai then , karena post adalah future
          "name": name,
          "nim": nim,
          "tempatLahir": tempatLahir,
          "tanggalLahir": tanggalLahir,
          "fakultas": fakultas,
          "jurusan": jurusan,
          "createdAt": datetimeNow.toString(),
          // createdAt diubah kdlm string , agar data yang masuk ke firebase berupa string
        },
      ),
    )
        .then(
      (response) {
        print("then function");
        // mendapakatkan id dari firabase
        // value ini adalah response dari post (kita bisa ubah namanya , sesuai dengan keinginan kita)
        // kita ubah value menjadi response
        // print(json.decode(response.body));

        // karena yang kita kirim body , maka response nya juga di body
        // kita decode terlebih dahulu
        // kita coba input data lagi dan kita chek pada debub konsole hasil print response nya
        // didalam debug , muncul hasil response  {name: -MqbO4ejdeiJxhIF3QZG}
        // name adalah key
        // -MqbO4ejdeiJxhIF3QZG adalah value uniq yang di random oleh firebase ,
        // jadi , untuk mendapatkan name , kita harus tambahkan key name pada body
        //  json.decode(response.body)["name"]

        // ini berfungsi untuk menambahkan data pada list , list ini berfungsi sebagai tempat
        // peniympanan sementara pada aplikasi
        // kita tambahkan name  dari firebase ke id
        // karana _allMahasiswa tidak mempunyai vaariabel response ,
        // maka kita harus memasukan nya kedalam methode then
        _allMahasiswa.add(
          Mahasiswa(
            // sebelum
            // id: datetimeNow.toString(),
            // sesudah
            id: json.decode(response.body)["name"].toString(),
            name: name,
            nim: nim,
            tempatLahir: tempatLahir,
            tanggalLahir: tanggalLahir,
            fakultas: fakultas,
            jurusan: jurusan,
            createdAt: datetimeNow,

            // cara bacanya , kita kirim data post . setelah data berhasil disimpan kedalam firebase .
            // simpan juga data pada temp (penyimpanan sementara pada aplikasi) yaitu list

            //disini terjadi error , data blm ditampilkan , tapi sudah berhasil ditambahkan

            // hal ini terjadi , ketika kita menjalankan fungsi add , selanjut nya memanggil http.
            // karena fungsi http adalah future , yang hasil nya tidak ditungguin . maka fungsi then blm di kerjakan
            // karena http blm selesai , sudah dilewati dan menjalankan fungsi yang ada dibawahnya ,
            // yaitu menampilkan notif.
            // dan menjalankan navigator pop pada halaman add .
            // karena fungsi add di panggil disana

            // solusi nya , kita harus membuat fungsi addMahasiswa memiliki methode then ,
            // dengan menambahkan future .
            // dan memasukan  navigator pop , agar ketika addMahasiswa blm selesai , tidak di pop terlebih dahulu
          ),
        );
        notifyListeners();
      },
    );
  }

  //  edit mahasiswa
  Future<void> editMahasiswa(
      String id,
      String name,
      String nim,
      String tempatLahir,
      String tanggalLahir,
      String fakultas,
      String jurusan,
      BuildContext context) async {
    Mahasiswa selectMahasiswa =
        _allMahasiswa.firstWhere((element) => element.id == id);
    selectMahasiswa.name = name;
    selectMahasiswa.nim = nim;
    selectMahasiswa.tempatLahir = tempatLahir;
    selectMahasiswa.tanggalLahir = tanggalLahir;
    selectMahasiswa.fakultas = fakultas;
    selectMahasiswa.jurusan = jurusan;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil diubah"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  //  delete Mahasiswa
  Future<void> deleteMahasiswa(String id) {
    Uri url = Uri.parse(
        // didalam url kita harus menambahkan id
        // agar ketika menghapus , tida terhapus semua .
        // penempatan id , setelah segmen (folder) yang ingin dihapus data nya .
        // dalam kasus ini , nama segmen nya adalah mahasiswa dan kita tempatkan setelah mahasisawa
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/$id.json");

    return http.delete(url).then(
      (response) {
        // menghapus data pada lokal penyimpanan berdasarkan id yang dipilih
        _allMahasiswa.removeWhere((element) => element.id == id);
        notifyListeners();
        print("proses dihapus");
      },
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
