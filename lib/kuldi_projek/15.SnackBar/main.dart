// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// snackbar :
// untuk menggunakan margin / width , behavior harus di set pada SnackBarBehavior.floating
// dan margin dan width tidak bisa dipasang secara bersamaan

// properti snackbar :
// duration : Jumlah waktu snack bar harus ditampilkan. Default  4.0 detik.

// backgroundColor :Warna latar belakang snack bar. Jika tidak ditentukan akan
// menggunakan [SnackBarThemeData.backgroundColor] dari [ThemeData.snackBarTheme].
// Jika itu tidak ditentukan, itu akan default ke variasi gelap [ColorScheme.surface]
// untuk tema cahaya, atau [ColorScheme.onSurface] untuk tema gelap.

// content: Konten utama dari snack bar.

// action: (opsional) Tindakan yang dapat diambil pengguna berdasarkan snack bar.
// Misalnya, snack bar mungkin membiarkan pengguna membatalkan operasi yang mendorong
// snackbar. Snack bar dapat memiliki paling banyak satu tindakan.
// Tindakan tersebut tidak boleh "memberhentikan" atau "membatalkan".

// margin: Ruang kosong untuk mengelilingi snack bar.
// Properti ini hanya digunakan ketika [behavior] adalah [SnackBarBehavior.floating].
// Itu tidak dapat digunakan jika [width] ditentukan.
// Jika properti ini batal, maka defaultnya adalah
// EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0).

// behavior : Ini mendefinisikan perilaku dan lokasi snackbar.
// Mendefinisikan di mana [SnackBar] harus muncul dalam [Scaffold] dan
// bagaimana lokasinya harus disesuaikan ketika perancah juga mencakup
// [FloatingActionButton]  atau [BottomNavigationBar]
// Jika properti ini batal, maka [SnackBarThemeData.behavior] dari
// [ThemeData.snackBarTheme] digunakan. Jika itu kosong,
// maka defaultnya adalah [SnackBarBehavior.fixed].

// dismissDirection : Arah di mana SnackBar dapat diberhentikan.
// Tidak bisa kosong, defaultnya [DismissDirection.down].

// padding : Jumlah padding untuk diterapkan pada konten snack bar dan tindakan opsional.

void main(List<String> args) {
  runApp(const SnackBarApp());
}

class SnackBarApp extends StatelessWidget {
  const SnackBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageSnackBar(),
    );
  }
}

class HomePageSnackBar extends StatelessWidget {
  const HomePageSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Snack Bar"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ini snackbar'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 4000),
                backgroundColor: Colors.amber,
                content: const Text(
                  'ini snackbar',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                action: SnackBarAction(
                  label: 'Cancel',
                  textColor: Colors.black,
                  onPressed: () {
                    print('Batal menghapus');
                  },
                ),
                margin: const EdgeInsets.all(20),
                behavior: SnackBarBehavior.floating,
                // width: 400,
                elevation: 50,
                dismissDirection: DismissDirection.horizontal,
                // padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
