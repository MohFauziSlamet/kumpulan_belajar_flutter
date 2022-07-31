import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/player.dart';
import 'package:http/http.dart' as http;

class AllMahasiswa with ChangeNotifier {
  List<Mahasiswa> _allMahasiswa = [];

  List<Mahasiswa> get allMahasiswa => _allMahasiswa;

  int get jumlahMahasiswa => _allMahasiswa.length;

  Mahasiswa selectById(String id) =>
      _allMahasiswa.firstWhere((element) => element.id == id);

  //
  addMahasiswa(
    String name,
    String nim,
    String tempatLahir,
    String tanggalLahir,
    String fakultas,
    String jurusan,
  ) async {
    DateTime datetimeNow = DateTime.now();

    // kita connect kan Database , dengan menambhkan url nya
    // kita parse string kedalam uri
    // karena url pada http post bertype Uri
    // Uri => Kelas Uri menyediakan fungsi untuk menyandikan (encode)dan memecahkan (decode )
    // kode string untuk digunakan dalam URI (yang mungkin Anda kenal sebagai URL).
    // Fungsi-fungsi ini menangani karakter yang khusus untuk URI, seperti &dan =.
    // Kelas Uri juga mengurai dan mengekspos komponen URI - host, port, skema, dan sebagainya.
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json?auth");
    // didalam url , kita juga harus menambahkan parameter / segmen / nama file sbg penyimpan data
    // letak di bagian akhir , url . dan berekstensi json

    // ketika menggunakan post , yang artinya menyimpan
    // kita juga harus manambahkan body , didalam body ini berisi data yang akan disimpan
    print("sebelum http");
    try {
      final response = await http.post(
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
      );

      // kita tambahkan pengkodisian untuk menangani error pada url
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // response.statusCode >= 200 && response.statusCode < 300
        // di adalah kode jika sukses menambahkan data pada database
        // jika true yang dijalankan adalah yang dibawah ini

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
      } else {
        // status code ini akan dilempar ke catchError
        throw (response.statusCode);
      }
    } catch (error) {
      throw (error);
    }
  }

  //  edit mahasiswa
  editMahasiswa(
    String id,
    String name,
    String nim,
    String tempatLahir,
    String tanggalLahir,
    String fakultas,
    String jurusan,
  ) async {
    // kita connect kan Database , dengan menambhkan url nya
    // kita parse string kedalam uri
    // karena url pada http post bertype Uri
    // Uri => Kelas Uri menyediakan fungsi untuk menyandikan (encode)dan memecahkan (decode )
    // kode string untuk digunakan dalam URI (yang mungkin Anda kenal sebagai URL).
    // Fungsi-fungsi ini menangani karakter yang khusus untuk URI, seperti &dan =.
    // Kelas Uri juga mengurai dan mengekspos komponen URI - host, port, skema, dan sebagainya.
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/$id.json");
    // didalam url , kita juga harus menambahkan parameter / segmen / nama file sbg penyimpan data
    // letak di bagian akhir , url . dan berekstensi json

    // ketika menggunakan post , yang artinya menyimpan
    // kita juga harus manambahkan body , didalam body ini berisi data yang akan disimpan
    print("sebelum http");

    try {
      // jika menggunakan patch , maka data yang diganti hanya yang dipilih saja
      // jika menggunakan put , maka data yang diganti seluruh nya , baik yang kena edit maupun tidak,
      // data lama akan di timpa dengan data yang baru
      // penggunaan put , tinggal mengganti patch saja .

      final response = await http.patch(
        url,
        body: json.encode(
          {
            // data yang mau kita ubah hanya ini
            // createdAt tetap
            "name": name,
            "nim": nim,
            "tempatLahir": tempatLahir,
            "tanggalLahir": tanggalLahir,
            "fakultas": fakultas,
            "jurusan": jurusan,
          },
        ),
      );

      //
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Mahasiswa selectMahasiswa =
            _allMahasiswa.firstWhere((element) => element.id == id);
        selectMahasiswa.name = name;
        selectMahasiswa.nim = nim;
        selectMahasiswa.tempatLahir = tempatLahir;
        selectMahasiswa.tanggalLahir = tanggalLahir;
        selectMahasiswa.fakultas = fakultas;
        selectMahasiswa.jurusan = jurusan;
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }

  //  delete Mahasiswa
  deleteMahasiswa(String id) async {
    Uri url = Uri.parse(
        // didalam url kita harus menambahkan id
        // agar ketika menghapus , tida terhapus semua .
        // penempatan id , setelah segmen (folder) yang ingin dihapus data nya .
        // dalam kasus ini , nama segmen nya adalah mahasiswa dan kita tempatkan setelah mahasisawa
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          // menghapus data pada lokal penyimpanan berdasarkan id yang dipilih
          _allMahasiswa.removeWhere((element) => element.id == id);
          notifyListeners();
          print("proses dihapus");
        },
      );

      if (response?.statusCode < 200 && response?.statusCode >= 300) {
        throw (response.statusCode);
      }
    } catch (error) {
      if (error != null) {
        throw (error);
      }
    }
  }

  //  delete Semua Mahasiswa
  Future<void> deleteAllMahasiswa() {
    Uri url = Uri.parse(
        // didalam url kita harus menambahkan id
        // agar ketika menghapus , tida terhapus semua .
        // penempatan id , setelah segmen (folder) yang ingin dihapus data nya .
        // dalam kasus ini , nama segmen nya adalah mahasiswa dan kita tempatkan setelah mahasisawa
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/.json");

    return http.delete(url).then(
      (response) {
        // menghapus data pada lokal penyimpanan berdasarkan id yang dipilih
        _allMahasiswa = [];
        notifyListeners();
        print("proses dihapus");
      },
    );
  }

  // mengambil semua data saat pertama kali membuka aplikasi
  Future<void> initialData() async {
    // kita membutuhkan uri Url , karena kita akan menggunakan http
    Uri url = Uri.parse(
        "https://http-req-1c29e-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa/.json");

    var hasilGetData = await http.get(url);

    // kita masukin value kedalam variabel , dan kita decode terlebih dahulu
    // kita sudah dapat data , dan untuk menampilkan satu persatu datanya
    // kita butuh me looping data tersebut.
    // kita bisa me looping data map dengan foreach(karena data dari database berupa map)
    // setelah kita decode , dan di tampung , type data menjadi dynamic , kita ubah terlebih dahulu
    // ke dalam map , dengan menambahkan keyword as map <string , dynamic>
    // sehinggan didalam data response akan ada enum foreach
    var dataResponse = json.decode(hasilGetData.body);
//  as Map<String, dynamic>
    // disini kita ngecek terlebih dahulu , apakah database kosong atau tidak ,
    // jika kosong , maka perintah ambil data tidak dijalnkan
    if (dataResponse != null) {
      dataResponse.forEach(
        (key, value) {
          // setelah kita cek dengan menggunakan print pada key nya ,
          // print(key); => key berisi id uniq , yang di generated oleh db firebase
          // sedangkan value
          //  print(value); => value berisi data mapping , yang isinya ada createdAt : beserta valuenya ,
          // nim , nama dll , beserta value dari masing masing key map nya

          // selanjutnya , kita bisa memasukan data key dan value tadi ke list allMahasiswa tadi ,
          // agar saat pertama kali dijalankan aplikasi , sudah ada datanya
          // kita tambahkan list _allMahasiswa , isi nya off Mahasiswa ,
          // karena _allMahasiswa bertype Mahasiswa

          // karena didalam list ada parameter bertype datetime
          // sedangkan value bertipe string semua , jadi dalam createdAt hrus kita
          // ubah kedalam bentuk datetime
          DateTime datetimeParse =
              DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);

          _allMahasiswa.add(
            Mahasiswa(
              id: key,
              createdAt: datetimeParse,
              name: value["name"],
              nim: value["nim"],
              tempatLahir: value["tempatLahir"],
              tanggalLahir: value["tanggalLahir"],
              fakultas: value["fakultas"],
              jurusan: value["jurusan"],
            ),
          );
        },
      );
      print("Berhasil mengambil data");
    } else {
      print("Tidak menjalankan ambil data");
    }

    notifyListeners();
  }
}
