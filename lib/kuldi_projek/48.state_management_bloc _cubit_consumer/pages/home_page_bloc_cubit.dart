import '../blocs/counter_bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocCubit extends StatelessWidget {
  const HomePageBlocCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BlocProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, int>(
              // buildWhen merupakan tempat kontrol builder .
              // jika dia bernilai false , maka builde tidak dijalankan
              // jika true dia akan menjalankan bulder.
              // didalam buildwhen , kita juga bisa menambhkan pengkondisian apapun , dan
              // kita wajib memberi return boolean .
              buildWhen: (previous, current) {
                // previuos merupakan state sebelum nya
                // current merupakan state saat ini
                // print(
                //     // "ini previuos : $previous -------------- ini current $current");

                return true;
              },

              listenWhen: (previous, current) {
                print(
                    "ini previuos : $previous -------------- ini current $current");
                if (current > 10) {
                  return true;
                }
                return false;
              },
              //
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("diatas ${state - 1}"),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              },

              //
              builder: (context, state) {
                return Text(
                  'Angka saat ini : $state',
                  style: TextStyle(fontSize: 25),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    return context.read<CounterCubit>().decrement();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    return context.read<CounterCubit>().increment();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}

// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: BlocBuilder<CounterCubit, int>(
//         builder: (context, count) => Center(child: Text('$count')),
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => context.read<CounterCubit>().increment(),
//           ),
//           const SizedBox(height: 4),
//           FloatingActionButton(
//             child: const Icon(Icons.remove),
//             onPressed: () => context.read<CounterCubit>().decrement(),
//           ),
//         ],
//       ),
//     );
//   }
// }
