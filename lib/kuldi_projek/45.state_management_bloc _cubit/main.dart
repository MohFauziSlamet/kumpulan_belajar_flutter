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

import 'package:belajar_flutter/kuldi_projek/45.state_management_bloc%20_cubit/blocs/counter_bloc_cubit.dart';
import 'package:belajar_flutter/kuldi_projek/45.state_management_bloc%20_cubit/pages/home_page_bloc_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const HomePageBlocCubit(),
      ),
    );
  }
}
