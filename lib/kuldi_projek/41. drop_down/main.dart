import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<String> data = ["Brazil", "Italia ", "Tunisia", 'Canada', 'Indonesia'];

    /// membuat list of mapping <String , dynamic>
    List<Map<String, dynamic>> dataMapping = [
      {
        'negara': 'Indonesia',
        'value': 1,
      },
      {
        'negara': 'Brazil',
        'value': 2,
      },
      {
        'negara': 'Italia',
        'value': 3,
      },
      {
        'negara': 'Tunisia',
        'value': 4,
      },
      {
        'negara': 'Canada',
        'value': 5,
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan Dropdown menu'),
        ),
        // body: Center(
        //   child: DropdownSearch<String>.multiSelection(
        //     mode: Mode.BOTTOM_SHEET,
        //     showSearchBox: true,
        //     showClearButton: true,
        //     items: data,
        //     dropdownSearchDecoration: InputDecoration(
        //       // contentPadding: EdgeInsets.symmetric(horizontal: 50),

        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       label: Text("Menu mode"),
        //       hintText: "country in menu mode",
        //     ),
        //     popupItemDisabled: (String s) => s.startsWith('I'),
        //     onChanged: print,
        //     selectedItems: [],
        //   ),
        // ),

        ///
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownSearch<Map<String, dynamic>>(
            mode: Mode.MENU,
            items: dataMapping,

            /// untuk mendisable data yang diinginkan , berlaku pada string
            // popupItemDisabled: ( s) => s.startsWith('I'),
            onChanged: (value) =>
                print(value?["value"] ?? 'Belum ada yang dipilih'),
            selectedItem: {
              'negara': 'Indonesia',
              'value': 1,
            },

            /// mengatur tampilan pada list item nya
            /// karena bentuk nya mapping , secara default akan ditampilkan semau
            /// jadi kita set custom , key apa yang ingin ditampilkan
            popupItemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(item['negara'].toString()),
              );
            },

            /// mengatur tampilan pada selectedItem
            dropdownBuilder: (context, selectedItem) {
              return Text(
                  selectedItem?['negara'] ?? ' Belum ada negara yang dipilih');
            },

            /// untuk menampilkan kotak pencarian pada Dropdown
            showSearchBox: true,

            /// untuk menambahkan tombol hapus , berupa simbol X
            showClearButton: true,
          ),
        ),
      ),
    );
  }
}
