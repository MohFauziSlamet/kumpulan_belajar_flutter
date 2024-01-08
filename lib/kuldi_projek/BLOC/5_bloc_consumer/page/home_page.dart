import 'package:belajar_flutter/kuldi_projek/BLOC/5_bloc_consumer/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Listener"),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, int>(
            bloc: myCounter,
            builder: (context, state) {
              return Center(
                child: Text(
                  "$state",
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              );
            },

            ///* widget yang akan di tampilkan , jika [listenWhen] me return true.
            listener: (context, state) {
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
                content: Row(
                  children: [
                    const Text("text"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Cancel"),
                    )
                  ],
                ),
              ));
            },

            ///* pengkondisian yang akan menentukan , kapan widget listener akan di tampilkan.
            listenWhen: (previous, current) {
              ///* contoh , snackbar akan tampil jika angka == 5.
              if (current == 5) {
                return true;
              }

              return false;
            },
          ),

          // ///* menggunakan bloc builder
          // ///* sebagai pengganti dari stream builder.
          // ///* BlocBuilder<nama_bloc_cubit , type_kembalian_dari_bloc_cubit>
          // BlocListener<CounterCubit, int>(
          //   bloc: myCounter,

          //   ///* widget yang akan di tampilkan , jika [listenWhen] me return true.
          //   listener: (context, state) {
          //     ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
          //       content: Row(
          //         children: [
          //           const Text("text"),
          //           TextButton(
          //             onPressed: () {},
          //             child: const Text("Cancel"),
          //           )
          //         ],
          //       ),
          //     ));
          //   },

          //   ///* pengkondisian yang akan menentukan , kapan widget listener akan di tampilkan.
          //   listenWhen: (previous, current) {
          //     ///* contoh , snackbar akan tampil jika angka == 5.
          //     if (current == 5) {
          //       return true;
          //     }

          //     return false;
          //   },
          //   child: BlocBuilder<CounterCubit, int>(
          //     bloc: myCounter,

          //     ///* buildWhen merupakan tempat kontrol builder .
          //     ///* jika dia bernilai false , maka builde tidak dijalankan
          //     ///* jika true dia akan menjalankan bulder.
          //     ///* didalam buildwhen , kita juga bisa menambhkan pengkondisian apapun , dan
          //     ///* kita wajib memberi return boolean .
          //     buildWhen: (previous, current) {
          //       // previuos merupakan state sebelum nya
          //       // current merupakan state saat ini
          //       log("ini previuos : $previous -------------- ini current $current");

          //       return true;
          //     },
          //     builder: (context, state) {
          //       return Center(
          //         child: Text(
          //           "$state",
          //           style: const TextStyle(
          //             fontSize: 50,
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          ///* button increment decrement
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myCounter.decrement(),
                icon: const Icon(
                  Icons.remove,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () => myCounter.increment(),
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
