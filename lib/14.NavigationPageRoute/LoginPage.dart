import 'package:flutter/material.dart';
import 'MainPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text('LOGIN'),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MainPage();
              }));
            }),
      ),
    );
  }
}
/*
navigator merupakan widget untuk mengelola route(screen) pada flutter,
didalam navigator terdapat 3 perintah pokok yaitu 

Navigator.pushReplacement : digunakan untuk mengganti route, misal
route login page yang di arahkan pada route mainpage. ketika sudah masuk pada
mainPage, maka tidak bisa kembali ke route loginPage.

Navigator.push : digunakan untuk menumpuk route , misal
kita berada pada route mainPage , lalu kita beri method push yang diarahkan pada
route secondPage .dengan methode push , kita bisa kembali lagi ke mainPage dengan method pop.

Navigator.pop : digunakan untuk mengangkat tumpukan pada route, misal
main page tadi sudah ditumpuk dengan route secondPage . ketika kita akan kembali
pada mainPage , kita harus mengangkat atau menarik route second page dari stack(tumpukan) 

 MaterialPageRoute , digunakan untuk membuat sebuah tampilan yang akan dituju.

 pushReplacement dan push harus menggunakan materialPageRoute , sedangkan pop tidak , 
 karena hanya untuk mengangkat route.
 */
