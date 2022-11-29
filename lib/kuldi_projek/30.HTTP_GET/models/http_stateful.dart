import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String email, fullName, avatar, id;

  HttpStateful(
      {this.id = "", this.email = "", this.fullName = "", this.avatar = ""});

  //
  static Future<HttpStateful> connectApi(String id) async {
    // kita buat dulu uri url dan kita pasre ke string
    Uri url = Uri.parse("https://reqres.in/api/users/ $id");

    // kita meminta data dengan method get
    // karena data belum bisa didapat
    var hasilResponse = await http.get(url);

    // kita decode bagian data , karena pada respos ada 2 key , yaitu data dan support
    var data = (jsonDecode(hasilResponse.body))["data"];

    // kita return data dan kita masukan kedalam constructor
    return HttpStateful(
      // khusus id , kita tambahkan to string , karena id berbentuk int
      id: data["id"].toString(),
      email: data["email"],
      fullName: " ${data["first_name "]} ${data["last_name"]}",
      avatar: data["avatar"],
    );
  }
}
