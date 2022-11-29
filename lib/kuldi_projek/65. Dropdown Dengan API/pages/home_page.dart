import 'dart:convert';

import 'package:belajar_flutter/kuldi_projek/65.%20Dropdown%20Dengan%20API/models/city.dart';
import 'package:belajar_flutter/kuldi_projek/65.%20Dropdown%20Dengan%20API/models/province.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String apiKey =
      "6e16c639654fa837e279fcd031d4157a1cd76bf41f68a59a3b8807c5bbf99164";

  String? idProvince;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wilayah Indonesia"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // dropdown_search provinsi
          DropdownSearch<Province>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            showClearButton: true,
            onChanged: (value) {
              idProvince = value?.id;
            },
            popupItemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(item.name),
              );
            },
            dropdownBuilder: (context, selectedItem) {
              return Text(selectedItem?.name ?? " Belum memilih provinsi");
            },

            /// menggantikan fungsi item untuk list dropdownnya
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));

              // jika gagal
              if (response.statusCode != 200) {
                return [];
              }

              // hasil decode variabel allProvinsi , masih berupa list of mapping
              // jadi kita butuh mengambil nilai string saja .
              // didalam maaping value ada key id(int) dan key name(string)
              // kita ambil value nya untuk dijadikan dropdown_search
              List allProvince =
                  (json.decode(response.body) as Map<String, dynamic>)['value'];

              // kita buat variabel list kosong , sebagai penampung
              List<Province> allModelProvince = [];

              for (var element in allProvince) {
                allModelProvince.add(
                  Province(
                    id: element['id'],
                    name: element['name'],
                  ),
                );
              }

              return allModelProvince;
            },
          ),
          const SizedBox(height: 20),

          DropdownSearch<City>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            showClearButton: true,
            onChanged: (value) {
              print(value);
            },
            popupItemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(item.name),
              );
            },
            dropdownBuilder: (context, selectedItem) {
              return Text(
                  selectedItem?.name ?? " Belum memilih kota / kabupaten");
            },

            /// menggantikan fungsi item untuk list dropdownnya
            onFind: (text) async {
              print("Chek id");
              print(idProvince);
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProvince"));

              // jika gagal
              if (response.statusCode != 200) {
                return [];
              }

              // hasil decode variabel allProvinsi , masih berupa list of mapping
              // jadi kita butuh mengambil nilai string saja .
              // didalam maaping value ada key id(int) dan key name(string)
              // kita ambil value nya untuk dijadikan dropdown_search
              List allCity =
                  (json.decode(response.body) as Map<String, dynamic>)['value'];

              // kita buat variabel list kosong , sebagai penampung
              List<City> allModelCity = [];

              for (var element in allCity) {
                allModelCity.add(
                  City(
                    id: element['id'],
                    idProvinsi: element['id_provinsi'],
                    name: element['name'],
                  ),
                );
              }

              return allModelCity;
            },
          ),
        ],
      ),
    );
  }
}
