import 'package:belajar_flutter/kuldi_projek/45.state_management_bloc%20_cubit/blocs/counter_bloc_cubit.dart';
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
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) => Text(
              'Angka saat ini : $state',
              style: TextStyle(fontSize: 25),
            ),
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
      )),
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
