/*
Catatan :
Bloc (business logic component) -> merupakan suatu pola (patern) untuk
memanagement suatu state.

gloasrium
stream(output / data keluar) : tempat untuk menerima data 
stream bluilder: untuk membungkus widget yang akan menerima data , jadi tidak semua dapat menerima data
aliran_data (StreamController): penghubung antara sync dengan mesin bloc, untuk mengalirkan
data dari sync(inputan) , untuk di proses didalam mesin bloc.stream controller bersifat private
stream_sinc (inputan / data masuk): sinc bersifat public 
mesin bloc: tempat memproses inputan , dia mau diapain . di mesin blok proses nya .
 */

import 'package:belajar_flutter/kuldi_projek/44.state_management_bloc/blocs/countet_bloc.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // kita panggil class bloc nya
  CounterBloc bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // kita bungkus widget yang akan menerima data dari stream , dengan widget
            // stream builder.
            // didalam StreamBuilder , terdapat builder , yang ada isi datanya nya ,
            // yaitu bernama snapshot .
            StreamBuilder(
              // stream : berisi stream yang telah menerima data dari controller _outputanController
              stream: bloc.output,
              // initialData -> untuk mengisi data snapshot , saat pertama kali di panggil
              initialData: bloc.counter,
              builder: (context, snapshot) => Text(
                'Data saat ini : ${snapshot.data}',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // row button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    bloc.sinkInputan.add('minus');
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    bloc.sinkInputan.add('add');
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
