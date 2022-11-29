import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/colors.dart';
import '../pages/add_color_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? allStatus = false;
  bool initStatus = true; // status awal data true , jadi mengambil terus

  // mengambil data ketika awal aplikasi dijalankan
  @override
  void didChangeDependencies() {
    setState(() {
      if (initStatus) {
        // dengan cara memanggil provider + function
        print("Mengambil data pertama kali");
        Provider.of<MultiColor>(context, listen: false).initialData();
        allStatus =
            Provider.of<MultiColor>(context, listen: false).checkAllStatus();

        initStatus = false;
        // setelah mengambil , initStatus kita ganti false , agar berhenti mengambil data
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // kita pasang provider , untuk mendapatkan data dari MultiColor
    // kita tampung semua data kedalam variabel colorsClass
    var colorsClass = Provider.of<MultiColor>(context);
    return Scaffold(
      //
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          // button untuk me routing ke halaman AddColorPage
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.pushNamed(context, AddColorPage.routeName),
          ),
        ],
      ),

      // untuk tampilan awal body ,kita cek dulu jumlah data pada colorsClass.
      // jika 0 , akan tampil no data.
      // jika ada data , akan tampil ListView dari data tsb
      body: colorsClass.colors.isEmpty
          ? const Center(
              child: Text(
                "No Data",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          : ListView(
              children: [
                // contoh chekbok manual
                // ListTile(
                //   leading: (Checkbox(value: false, onChanged: (value) {})),
                //   title: Text("Ini chekbox"),
                // ),
                // Divider(
                //   color: Colors.purple,
                // ),

                // gabungan antara checkbox dg listile
                CheckboxListTile(
                  // allStatus bernilai awal false
                  value: allStatus,
                  onChanged: (value) {
                    setState(() {
                      allStatus = value;

                      // kita panggil fungsi selectAll , untuk mengechek apakah semuanya trus
                      colorsClass.selectAll(allStatus);
                    });
                  },
                  title: const Text("Select all colors"),
                  // penempatan posisi checkboxnya
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                const Divider(),

                // menggunakan spread colecction , untuk memasukan list colors
                // kedalam children widget
                // dan kita harus melakukan mapping , dan ki pasre ke list( toList() )
                ...colorsClass.colors
                    .map(
                      // kita meruturn  ChangeNotifierProvider.value , agar kita bisa mendapatkan
                      // semua yang ada pada list SingleColor , per itemnya
                      (e) => ChangeNotifierProvider.value(
                        value: e,
                        builder: (context, child) => CheckboxListTile(
                          value: e.status,

                          // untuk merubah toogleStatus tiap tiap item
                          onChanged: (value) {
                            setState(() {
                              // merubah statut
                              e.toogleStatus();
                              // mengecek all status dari tiap tiap item
                              //
                              allStatus = colorsClass.checkAllStatus();

                              print(allStatus);
                            });
                          },

                          title: Text(e.title),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                          // posisi secondary == trailing pada listile
                          secondary: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              colorsClass.deleteColor(e.id);
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
    );
  }
}
