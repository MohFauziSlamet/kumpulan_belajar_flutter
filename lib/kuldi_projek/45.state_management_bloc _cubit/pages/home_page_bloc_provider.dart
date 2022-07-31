import 'package:belajar_flutter/kuldi_projek/28.Review/main.dart';
import 'package:belajar_flutter/kuldi_projek/45.state_management_bloc%20_cubit/blocs/counter_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// menggunakan state memanagement BlocProvider
class HomePageBlocProvider extends StatelessWidget {
  const HomePageBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // cek debug
    print("build");
    // jika menggunakan provider , maka  listen nya bernilai default true
    // namun jika menggunakan bloc provider , maka listennya bernilai default nya false

    //  BlocProvider.of<CounterBlocProvider>(context); dan context.read<CounterBlocProvider>();
    //  adalah sama . yang membedakan , kalo context.read listen nya tidak bisa diubah , dan bernilai false.
    // jika listen nya berniai true , si provider maupun blocprovider akan memantau setiap perubahan yang ada didalam
    // class nya . sehingga setiap kali ada perubahan akan dilakukan re build . dan ini akan memakan memori yang banyak.
    // sehingga , gunakanlah seperlunya dan yang hanya membutuhkan perubahan saja .
    // var bloc = BlocProvider.of<CounterBlocProvider>(context);
    // var bloc = context.read<CounterBlocProvider>();

    //  context.watch<CounterBlocProvider>(); , sama dengan read , namun listennyta selalu true.
    var bloc = context.watch<CounterBlocProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BlocProvider'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBlocProvider, int>(builder: (context, state) {
            print(
                'Ini adalah state : ${state} ... Ini adalah counter : ${bloc.counter}');
            return Text(
              (state == bloc.counter)
                  ? 'Angka saat ini : $state'
                  : 'Angka saat ini : ${bloc.counter}',
              style: TextStyle(fontSize: 25),
            );
          }),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  bloc.add('minus');
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  bloc.add('add');
                },
                icon: Icon(Icons.add),
              ),
            ],
          )
        ],
      )),
    );
  }
}
