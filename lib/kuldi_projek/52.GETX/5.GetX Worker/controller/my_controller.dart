import 'package:get/get.dart';

// catatan :
// ketika suatu controller pertamakali dipanggil , ia akan pertama dibuat
// saat itu juga, selanjutnya di inisiasi

// onInit : dijalakankan ketika class pertama kali dipanggil
// dialam onInit terdapat beberapa function :
// - ever(lisneter, callback)
//  listener bisa berisi satu sebuah variabel , atau menggunakan everAll untuk
//  lebih dari satu variabel yang akan dipantau.
//  maka setiap terjadi perubahan pada listener , maka function callback akan menjalankan
//  suatu perintah.

class MyController extends GetxController {
  RxInt count = 0.obs;

  void change() => count++;

  void reset() => count.value = 0;

  @override
  void onInit() {
    print("onInit dibuat 1 x");

    // // data yang di listen hanya 1
    // ever(
    //   count,
    //   (_) => print('ever dijalankan'),
    // );

    // // data yang dilisten lebih dari 1, dan berbentuk list
    // everAll(
    //   [count],
    //   (_) => print('everAll dijalankan'),
    // );

    // dijalankan seklai , ketika pertama kali dipanggil
    // once(
    //   count,
    //   (callback) => print('once dijalankana'),
    // );

    // akan dijalankan ketika terjadi perubahaan pada listener , dan dapat kita atur durasinya
    // dan perintah akan dijalankan ketika durasinya sudah habis
    // debounce(
    //   count,
    //   (callback) => print("debonce dijalankan"),
    //   time: Duration(seconds: 1),
    // );

    // perintah akan dijalankan setiap jarak waktu yang ditentukan
    // interval(
    //   count,
    //   (callback) => print('interval dijalankan'),
    //   time: Duration(seconds: 3),
    // );
    super.onInit();
  }
}

/* 
ever
terpanggil setiap kali variabel Rx meng-emit value baru.

everAll
Mirip seperti ever, tapi menerima List sebagai nilai Rx, terpanggil setiap kali 
variabel berubah.

once
Terpanggil hanya sekali pada saat pertama kali variabel berubah.

debounce
'debounce' sangat berguna pada fungsi pencarian, dimana anda hanya ingin API dipanggil 
ketika user selesai mengetik. Jika user mengetik "Jonny", anda akan pendapatkan 5 
pencarian di API, dengan huruf J, o, n, n, dan y. Dengan Get, ini tidak terjadi lagi, 
karena anda memiliki sebuah "debounce" worker, yang akan men-trigger pada akhir pengetikan.

interval
berbeda dengan debounce. untuk debounce, jika user melakukan 1000 perubahan terhadap sebuah 
variabel dalam 1 detik, dia akan mengirim hanya yang terakhir setelah waktu yang ditetapkan 
(defaultnya adalah 800 milisekon).
Interval bekerja sebaliknya, dia akan mengabaikan semua interaksi user dalam rentang waktu 
yang ditentukan. Jika anda mengirim event dalam 1 menit, 1000 per detik, debounce akan 
mengirimkan anda yang terakhir, ketika user berhenti melakukan spam terhadap event. 
Interval akan mengantar event setiap detik, dan jika diatur menjadi 3 detik, dia akan 
mengirimkan 20 event setiap menit.
*/
