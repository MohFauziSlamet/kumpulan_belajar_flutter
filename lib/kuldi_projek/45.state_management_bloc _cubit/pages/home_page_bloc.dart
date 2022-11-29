import 'package:belajar_flutter/kuldi_projek/45.state_management_bloc%20_cubit/blocs/countet_bloc.dart';
import 'package:flutter/material.dart';

// HomePage menggunakan bloc secara manual
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
        title: const Text('Counter Bloc'),
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
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
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
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    bloc.sinkInputan.add('add');
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
