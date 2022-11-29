import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //menghilangakan logo dibug banner menjadi hilang
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// ignore: camel_case_types
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  /// function untuk lingkaran kecil
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  /// function untuk lingkaran besar
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F0),
      body: Stack(
        children: [
          /// lingkaran pojok kanan atas
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 3,
            child: Container(
              width: getSmallDiameter(context),
              height: getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),

          /// lingkaran pojok kiri atas
          Positioned(
            left: -getBigDiameter(context) / 4,
            top: -getBigDiameter(context) / 3,
            child: Container(
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: const Center(
                child: Text(
                  "dribblee",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontFamily: "Pacifico"),
                ),
              ),
            ),
          ),

          /// lingkaran pojok kanan bawah
          Positioned(
            right: -getBigDiameter(context) / 2,
            bottom: -getBigDiameter(context) / 2,
            child: Container(
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
            ),
          ),

          /// menambahkan aligment agar Listview nanti kebawah
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                /// TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: const [
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Color(0xFFFF4891),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF4891),
                            ),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Color(0xFFFF4891),
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Color(0xFFFF4891),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF4891),
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color(0xFFFF4891),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                /// forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: const Text("Forgot Password?",
                        style:
                            TextStyle(color: Color(0xFFFF4891), fontSize: 11)),
                  ),
                ),

                /// row isian button 3
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// sign in
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 35,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFB226B2),
                                Color(0xFFFF4891),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.amber,
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// button facebook
                      FloatingActionButton(
                        mini: true,
                        elevation: 0,
                        onPressed: () {},
                        child: const Image(
                          image: AssetImage("assets/logo_fb.png"),
                        ),
                      ),

                      /// button twitter
                      FloatingActionButton(
                        mini: true,
                        elevation: 0,
                        onPressed: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Image(
                            image: AssetImage("assets/logo_twitter.jpg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // row text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "DON'T HAVE AN ACCOUNT?",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xffff4891),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
