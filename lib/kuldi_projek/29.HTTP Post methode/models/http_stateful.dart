import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  //kita siapkan variabel
  String id, name, job, createdAt;

  HttpStateful({
    this.createdAt = "",
    this.id = "",
    this.job = "",
    this.name = "",
  });

  // kita buat sebuah funtion
  // kita gunakan keyword static , agar function dapat terekspose
  // ketika class HomeStateful di panggil
  // sama ketika kita buat routes

  // kita juga harus menambahkan type future , karena data yang didapat masih masa depan ,
  // (butuh nunggu sebentar)
  // yang kita tunggu adalah HttpStateful , maka kita harus menggunakan type data HttpStateful
  static Future<HttpStateful> connectApi(String name, String job) async {
    // kita parse string kedalam uri
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");

    // http.post , digunakan untuk mengirim data ,
    // dan data yang dikirm ada 2
    // setelah mangirim data (request) , akan ada response
    // response tsb langsung kita masukan kedalam variabel
    // tiap kali ada request pasti ada response
    // var hasilResponse merupakan tempat untuk menampung respon
    var hasilResponse = await http.post(
      url,
      // didalam body berisi data yang akan dikirimkan
      body: {"name": name, "job": job},
    );

    // kita sudah mendapat kan response data yang disimpan kedalam hasilResponse
    // selanjut nya kita parsing dan kita masukan kedalam constructor
    // penambahan await dan async ,
    // artinya , ketika pertama kali mengirim data , kan blm ada response.
    // ketika belum ada respon , hasilResponse masih kosong .
    // jadi sebelum hasilResponse di decode , kita suruh nunggu dulu .dengan memberi method await
    // await merupakan future , jadi kita harus menambahkan async
    // setelah di decode , kita tampung dulu data kedalam variabel
    var data = json.decode(hasilResponse.body);

    // setelah di decode , kita return skaligus memasukan kedalam constructor
    return HttpStateful(
        // karena data dalam bentuk mapping , kita menggunkanannya harus dengan cara yang ada di map
        createdAt: data["createdAt"],
        id: data["id"],
        job: data["job"],
        name: data["name"]);
  }
}
