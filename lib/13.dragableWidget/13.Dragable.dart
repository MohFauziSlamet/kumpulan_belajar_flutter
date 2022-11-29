import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color1 = Colors.red;
  Color color2 = Colors.amber;
  Color? targetColor;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latian DragAble Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //lingkaran 1
                  Draggable<Color>(
                    data: color1,
                    //childWhenDragging : widget yang akan digambar ketika kita men.drag widget tersebut
                    // widget ini akan mengisi posisi awal dari widget tadi , menggantikannya
                    childWhenDragging: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.grey,
                        shape: StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color1.withOpacity(0.7),
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color1,
                        shape: const StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  ),

                  //lingkaran 2
                  Draggable<Color>(
                    data: color2,
                    childWhenDragging: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: Colors.grey,
                        shape: StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                    // feedback bentuk widget ketika di drag. atau digesert
                    feedback: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2.withOpacity(0.7),
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Material(
                        color: color2,
                        shape: const StadiumBorder(),
                        elevation: 3,
                      ),
                    ),
                  )
                ],
              ),

              //lingkaran target
              DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  isAccepted = true;
                  targetColor = value;
                },
                // builder digunakan untuk menggambar DragTarget tadi
                builder: (context, candidates, rejected) {
                  return (isAccepted)
                      ? SizedBox(
                          width: 100,
                          height: 100,
                          child: Material(
                            color: targetColor,
                            shape: const StadiumBorder(),
                            elevation: 0,
                          ),
                        )
                      : const SizedBox(
                          width: 100,
                          height: 100,
                          child: Material(
                            color: Colors.black26,
                            shape: StadiumBorder(),
                            elevation: 0,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TODO:
/*
SizedBox : Properti yang digunakan untuk membungkus widget yang 
tidak memiliki properti width dan height , supaya memiliki width dan height .
Material :
shape :
StadiumBorder:berfungsi membuat ujung / pokok suatu kotak menjadi tirus menyerupai
lingkaran (circular). oleh karena ukuran width 50 dan height 50 , maka bentuknya 
akan menyerupai lingkaran.
elevation : digunakan untuk mengatur ketinggian suatu widget , shg akan menghasilkan 
efek shadow .
*/
