import 'package:flutter/material.dart';
import 'dart:math';

// ignore: camel_case_types
class ColorfullButton extends StatefulWidget {
  final Color mainColor, secondColor;
  final IconData iconData;
  const ColorfullButton(this.mainColor, this.secondColor, this.iconData,
      {Key? key})
      : super(key: key);

  @override
  _ColorfullButtonState createState() =>
      // ignore: no_logic_in_create_state
      _ColorfullButtonState(mainColor, secondColor, iconData);
}

class _ColorfullButtonState extends State<ColorfullButton> {
  // karna button nanti akan memilik warna yang berbeda
  // kita buat variabel button terlebih dahulu.
  Color mainColor, secondColor;

  // kita buat variabel untuk icon juga
  IconData iconData;

  // agar kita tau , button sedang ditekan atau tidak
  // kita buat variabel untuk menangani hal tsb
  bool isPresed = false;

  // agar dipakai pada main.
  // kita buat constructor terlebih dahulu
  _ColorfullButtonState(this.mainColor, this.secondColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // angle artinya kita putar berapa derajat
      // untuk memutar kira butuhkan derajat radian dan pi (3.14 ....)
      // 1 pi radian = 180 derajat
      // untuk menggunakan pi , kita import dart math
      angle: pi / 4,
      child: GestureDetector(
        // agar button kita dapat diklik dan berubah warna , kita tambahkan GestureDetector
        // ketika diklik
        onTapDown: (detail) {
          setState(() {
            isPresed = !isPresed;
          });
        },
        // ketika kita geser naik
        onTapUp: (detail) {
          setState(() {
            isPresed = !isPresed;
          });
        },
        // ketika sudah diklik, tapi tidak dilepas didalam button . dan kita geser keluar button
        // maka onTapCancel akan jalan
        onTapCancel: () {
          setState(() {
            isPresed = !isPresed;
          });
        },

        child: Material(
          //kita tambahkan  widget material untuk menambahkann shadow
          // borderRadius harus disamakan
          borderRadius: BorderRadius.circular(15),
          // efek shadow jika ditekan 5 ,
          elevation: (isPresed) ? 5 : 10,
          shadowColor: (isPresed) ? secondColor : mainColor,
          child: ClipRRect(
            // agar lingkaran kedua bagian luar terpotong
            // kita menggunakan ClipRRect , dan diberi borderRadius.circular 15
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              //kita menggunakan stack, karna nanti dalam pembuatan button
              // kita akan menumpuk beberapa widget
              children: [
                //kita menggunakan material sbg widget dasar nya
                // kita bungkus dengan SizedBox, supaya memiliki properti with dan height
                SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      // agar tiap sudutnya tidak lancip , kita tambahkan borderradius
                      borderRadius: BorderRadius.circular(15),
                      color: (isPresed) ? secondColor : mainColor,
                      child: Transform.rotate(
                        // karena widget kita putar
                        // maka icon otomatis ikut berputar.
                        // untuk mengembalikan ke posisi awal , kita putar balik sejauh -45 derajat
                        angle: -pi / 4,
                        child: Icon(
                          iconData,
                          color: Colors.white,
                        ),
                      ),
                    )),
                // untuk menggeser lingkarannya, kita membutuhkan widget Transform.translate
                Transform.translate(
                  //nilai pertama horizontal , nilai kedua vertikal
                  // horizontal + = kekanan
                  // vertikal + = kebawah
                  offset: const Offset(30, 30),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        // agar tiap sudutnya tidak lancip , kita tambahkan borderradius
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.3),
                      )),
                ),
                Transform.translate(
                  //nilai pertama horizontal , nilai kedua vertikal
                  // horizontal + = kekanan
                  // vertikal + = kebawah
                  offset: const Offset(-30, 30),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        // agar tiap sudutnya tidak lancip , kita tambahkan borderradius
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.3),
                      )),
                ),
                Transform.translate(
                  //nilai pertama horizontal , nilai kedua vertikal
                  // horizontal + = kekanan
                  // vertikal + = kebawah
                  offset: const Offset(-30, -30),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        // agar tiap sudutnya tidak lancip , kita tambahkan borderradius
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.3),
                      )),
                ),
                Transform.translate(
                  //nilai pertama horizontal , nilai kedua vertikal
                  // horizontal + = kekanan
                  // vertikal + = kebawah
                  offset: const Offset(30, -30),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Material(
                        // agar tiap sudutnya tidak lancip , kita tambahkan borderradius
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.3),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
